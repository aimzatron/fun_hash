require './link.rb'
class LinkedList
  attr_accessor :first_link

  def initialize()
  end

  def add(key, value)
    if first_link.nil?
      self.first_link = Link.new(key,value)
    else
      first_link.add(key, value)
    end
  end

  def remove(key,value)
    first_link.remove(key,value)
  end

  def find(key, value)
    first_link.find(key,value).value
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
    self.first_link.each{|l| yield l.value } rescue nil
  end

end