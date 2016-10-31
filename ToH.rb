class ToH
  def initialize
    @peg1 = Peg.new
    @peg2 = Peg.new
    @peg3 = Peg.new
    @board = { one: @peg1, two: @peg2, three: @peg3 }
  end

  def gamelogic    
    set_discs
  end

  def set_discs
    puts "how many discs do you want?"
    amount = gets.strip.to_i
    temp_hash = {}
    amount.downto(0) do |keyname|
      temp_hash[keyname] = keyname
    end
    temp_hash.delete(0)
    @peg1.stack = temp_hash    
  end

  def move(from,to)
    
    display
  end

  def is_valid?
    #
  end

  def display
    puts @peg1.stack ; puts @peg2.stack; puts @peg3.stack; 
  end

end

class Peg
  attr_accessor :stack
  def initialize 
    @stack = {}
  end
end

class Disc
  attr_accessor :pegsize 
  def intitialize(size = 0)
    @size = size
  end
end

a = ToH.new
puts a
a.display
a.set_discs
a.display