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
    buckets[index].add(key,value)
    buckets[index] = value
  end

  def [](key)
    buckets[key_2_index(key)]
  end

  def first

  end

  private

  def key_2_index(key)
    Digest::MD5.hexdigest(key.to_s).hex % ARRAY_SIZE
  end

end