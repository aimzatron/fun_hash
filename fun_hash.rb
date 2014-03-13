require './linked_list.rb'
require 'digest/md5'

class FunHash
  attr_accessor :buckets
  ARRAY_SIZE = 100

  def initialize()
    @buckets = Array.new

    for i in 0..99
      @buckets[i] = LinkedList.new()
    end
  end

  def []=(key,value)
    index = key_2_index(key)
    unless @buckets[index].find_and_replace(key, value)
      @buckets[index].add(key.to_s,value)
    end
  end

  def [](key)
    @buckets[key_2_index(key)].find_by_key(key.to_s)
  end

  def keys
    keys_array = []
    @buckets.each do |list|
      list.each do |value, key|
        keys_array << key unless key == nil
      end
    end
    keys_array.sort!
  end

  def values
    values_array = []
    @buckets.each do |list|
      list.each do |value, key|
        values_array << value unless value == nil
      end
    end
    values_array.sort!
  end

  def empty?
    self.size == 0   
  end

  def first
    first_array = []
    if self.keys[0] == nil
      first_array = nil
    else
      first_array << self.keys[0]
      first_array << self.values[0]
    end
    first_array
  end

  def delete(key)
    bucket = @buckets[key_2_index(key)]
    link = bucket.locate_link_with_key(key)
    link.delete_with_key(key)
  end

  def size
    self.keys.size
  end

  def find_by_key(key)
    if self.key == key
      self
    else
      self.tail.find(key)
    end
  end

  def each(&block)
    @buckets.each do |ll|
      ll.each do |key, value|
        yield value, key
      end
    end
  end

  def ==(hash)
    if self.values == hash.values && self.keys == hash.keys
      true
    else
      false
    end
  end

  private

  def key_2_index(key)
    Digest::MD5.hexdigest(key.to_s).hex % ARRAY_SIZE
  end

end