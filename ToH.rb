class ToH
  def initialize
    @peg1 = Peg.new
    @peg2 = Peg.new
    @peg3 = Peg.new
  end

  def gamelogic
    
    set_disks
  end

  def set_disks
    puts "how many disks do you want?"
    amount = gets.strip.to_s
    temp_hash = {}
    amount.downto(0) do |keyname|
      temp_hash << keyname: keyname.to_i
    end    

  end
end

class Peg
  attr_accessor :stack
  def initialize 
    @stack = []
  end
end

class Disc
  attr_accessor :pegsize 
  def intitialize(size = 0)
    @size = size
  end
end

a = new.ToH
puts a