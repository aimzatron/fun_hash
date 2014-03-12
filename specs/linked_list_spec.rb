require './linked_list'
  describe LinkedList do
    before(:each) do
      @list = LinkedList.new()
      @list.add('a', 'a')
    end

    xit "adds an element" do
      @list.add('b')
      expect(@list.last).to eq 'b'
    end

    xit "adds additional elements to the end of the list" do
      @list.add('b')
      @list.add('c')
      expect(@list.last).to eq 'c'
    end

    xit "removes a given element from the list" do
      @list.add('b')
      @list.add('c')
      @list.remove('b')
      expect(@list.first).to eq 'a'
      expect(@list.last).to eq 'c'
    end

    xit "finds a given element" do
      @list.add('b')
      @list.add('c')
      @list.add('d')

      expect(@list.find('c')).to eq 'c'
    end

    xit "iterates over each item" do
      @list.add('b')
      @list.add('c')

      str = ''
      @list.each{|l| str += l}
      expect(str).to eq 'abc'
    end

    it "can find and replace a value" do
      @list.add('b', 'b')
      @list.add('c', 'c')

      expect(@list.find('c')).to eq ('c')

      @list.find_and_replace('c','x')
      expect(@list.find_by_key('c')).to eq ('x')
    end

  end
