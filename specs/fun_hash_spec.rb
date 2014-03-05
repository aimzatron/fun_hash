require './fun_hash'
  describe FunHash do
    before(:each) do
      @hash = FunHash.new
    end

    it "should store values" do
      @hash['b'] = 'b'
      @hash['yo mama'] = 'c'

      expect(@hash['b']).to eq 'b'
      expect(@hash['yo mama']).to eq 'c'
    end

    it "handles integer keys" do
      @hash[0] = 'a'
      expect(@hash[0]).to eq 'a'
      expect(@hash['0']).to eq 'a'      
    end

    it "handles collisions" do
      @hash['b'] = 'b'
      @hash['c'] = 'c'

      expect(@hash['b']).to eq 'b'
      expect(@hash['c']).to eq 'c'
    end

    xit "should allow values to change" do
      @hash['a'] = 'a'
      @hash['b'] = 'b'

      expect(@hash['a']).to eq 'a'
      expect(@hash['b']).to eq 'b'

      @hash['b'] = 'c'

      expect(@hash['a']).to eq 'c'
      expect(@hash['b']).to eq 'c'
    end

    xit "knows it's size" do
      @hash[7] = 'seven'
      @hash[8] = 'eight'

      expect(@hash.size).to eq 2
    end

    xit "knows when it's empty" do
      expect(@hash.empty?).to be_true

      @hash[1] = 'a'

      expect(@hash.empty?).to be_false
    end

    xit "returns first" do
      expect(@hash.first).to be_nil
      @hash["k"] = 'v'
      expect(@hash.first).to eq ['k','v']
    end

    xit "knows it's keys" do
      expect(@hash.keys).to eq []

      @hash['a'] = 'a'
      @hash['b'] = 'a'
      @hash['c'] = 'a'

      expect(@hash.keys).to eq ['a','b','c']
    end

    xit "iterates over each item" do

      str = ''
      @hash.each{|k,v| str << "#{k}:#{v}|"}

      str.should eq ''


      @hash['a'] = 'x'
      @hash['b'] = 'y'
      @hash['c'] = 'z'

      str = ''
      @hash.each{|k,v| str << "#{k}:#{v}|"}

      str.should eq 'a:x|b:y|c:z|'
    end

    xit "deletes an item" do
      @hash['a'] = 'x'
      @hash['b'] = 'y'
      @hash['c'] = 'z'

      expect(@hash['b'] == 'y')

      @hash.delete('b')

      expect(@hash['b'] == nil)
    end

    xit "knows when it is equal to another 'fun' hash" do
      @hash2 = FunHash.new
      expect(@hash == @hash2).to be_true

      @hash2['a'] = 'x'
      expect(@hash == @hash2).to be_false

      @hash['a'] = 'x'
      expect(@hash == @hash2).to be_true

      @hash['b'] = 'y'
      expect(@hash == @hash2).to be_false

      @hash2['b'] = 'y'
      expect(@hash == @hash2).to be_true

    end

  end
