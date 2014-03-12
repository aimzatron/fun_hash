class Link
  attr_accessor :value, :tail, :head, :key

  def initialize(key, value, head=nil)
    @value = value
    @head = head
    @key = key
  end

  def add(key,value)
    if self.last?
      self.tail = Link.new(key, value, self)
    else
      self.tail.add(key,value)
    end
  end

  def remove(value)
    if self.value != value
      self.find(value).remove(value)
    else
      puts "#{self.value} : #{self.head} : #{self.tail}"
      self.tail.head = self.head unless self.last?
      self.head.tail = self.tail unless self.first?
    end
  end

  def delete_with_key(key)
    if self.key != key
      self.find_with_key(key).remove(value)
    else
      self.tail.head = self.head unless self.last?
      self.head.tail = self.tail unless self.first?
    end
  end

  def find(value)
    if self.value == value
       self
    else
      self.tail.find(value)
    end
  end

  def find_by_key(key)
    if self.key == key
      self
    else
      self.tail.find_by_key(key)
    end
  end

  def first?
    self.head.nil?
  end

  def last?
    self.tail.nil?
  end

  def each(&block)
    yield(self)
    self.tail.each &block unless self.last?
  end

end