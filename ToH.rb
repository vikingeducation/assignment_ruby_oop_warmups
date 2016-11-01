class ToH
  def initialize
    @peg1 = Peg.new
    @peg2 = Peg.new
    @peg3 = Peg.new
    @board = { 1 => @peg1, 2 => @peg2, 3 => @peg3 }
  end

  def gamelogic    
    set_discs
    move(1,3)
    display
  end

  def get_peg
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

  def valid_input?(input)
    input.match(/\A[1-3],[1-3]/)
  end

  def user_input
    puts "Where do you want to from and to?"
    input = gets.chomp
    if valid_input?(input)
      input1 = input.split("")[0]
      input2 = input.split("")[2]
      move(input1, input2)
    else
      puts "invalid input"
      user_input
    end
  end

  def move(from,to)
    display
    temp = @board[from].stack.keys.min()
    @board[to].stack[temp] = temp
    @board[from].stack.delete(temp)
  end

  def is_move_valid?(from, to)
    tempfrom = @board[from].stack.keys.min()
    tempto = @board[from].stack.keys.min() || 0
    if tempfrom.nil?
      false
    elsif tempto < tempfrom
      false
    else
      true  
    end 
  end

  def game_over?

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
a.user_input