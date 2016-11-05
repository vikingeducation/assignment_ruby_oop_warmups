require_relative 'render'
require_relative 'board'
require_relative 'peg'
require_relative 'player'

class ToH
  include Render
  
  def initialize
    @discs = nil     
    @game_over = false
    @peg1 = Peg.new 
    @peg2 = Peg.new
    @peg3 = Peg.new
    @all_pegs = {'1' => @peg1.stack, '2' => @peg2.stack, '3' => @peg3.stack}
  end

  def valid_input?(input)
    input.match(/\A[1-3],[1-3]/)
  end
  
  def valid_move?(input)
    from_peg = input[0]
    to_peg = input[2]
    
    from_peg_array = @all_pegs[from_peg]
    to_peg_array = @all_pegs[to_peg]
    
    unless to_peg_array.size.zero?
      return false if to_peg_array.last < from_peg_array.last
    end

    @from_peg = from_peg
    @to_peg = to_peg
  end  
  
  def user_input
    puts "\nEnter a valid move:\r"
    input = gets.strip
    
    quit if input.downcase == 'q'
    
    if valid_input?(input) && valid_move?(input) 
      move
    else
      user_input
    end
  end
  
  def move
    a = @all_pegs[@from_peg]
    b = @all_pegs[@to_peg]
    b << a.pop
    b.compact! #Allows for a more nuanced way if the same peg is selected for both
  end

  def quit
    puts "\nThanks for playing, see you next time!\r"
    exit
  end
  
  def game_over?
    if (@peg2.stack == @winning_sequence) || (@peg3.stack == @winning_sequence)
      render
      puts "\nYOU WON!"
      @game_over = true 
    end
  end 
  
  def play_again?
    puts "Would you like to play again? (Y/N)"
    input = gets.strip.downcase
    
    if input === 'y'
      t = TowerOfHanoi.new(3)
      t.play
    elsif input === 'n'
      quit 
    else
      play_again?
    end
  end
  
  def play
    tower_setup 
    puts @all_pegs
    until @game_over
      render
      puts @all_pegs
      user_input
      game_over?
    end
    play_again?
  end
  
end

ToH.new.play
