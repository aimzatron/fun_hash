require './link.rb'
class LinkedList
  attr_accessor :first_link

  def initialize()
  end

  def add(key, value)
    if first_link.nil?
      self.first_link = Link.new(key, value)
    else
      first_link.add(key, value)
    end
  end

  def remove(key)
    first_link.delete_with_key(key)
  end

  def find(key)
    first_link.find(key).value
  end

  def find_and_replace(key,value)
    (first_link.find_by_key(key).value = value) rescue false
  end

  def find_by_key(key)
    first_link.find_by_key(key).value rescue nil
  end

  def locate_link_with_key(key)
    first_link.find_by_key(key) rescue nil
  end

  def first
    first_link.each do |link|
      return link.value if link.first?
    end
  end

  def last
    first_link.each do |link|
      return link.value if link.last?
    end
  end

  def each(&block)
    self.first_link.each{|l| yield l.value,l.key} rescue nil
  end

end