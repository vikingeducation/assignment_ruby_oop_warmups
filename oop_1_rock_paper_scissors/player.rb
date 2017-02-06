require_relative 'rock.rb'
require_relative 'paper.rb'
require_relative 'scissors.rb'

class Player
  def initialize(name)
    @name = name
    @move = nil
  end

  def move
    @move
  end

  def move=(move)
    @move = move
  end

  def choose_move
    puts "Please choose a move by entering 'rock', 'paper', or 'scissors'."
    move_choice = gets.chomp.downcase

    case move_choice
      when "rock"
        @move = Rock.new
      when "paper"
        @move = Paper.new
      when "scissors"
        @move = Scissors.new
      else
        puts "Invalid entry"
        choose_move
    end
  end

  def name
    @name
  end
end