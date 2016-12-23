#!/usr/bin/ruby
# Towers of Hanoi\
# To run this enter the following, create a new TOH object
# e.g. tow = TowerOfHanoi.new(3)
# then run the play function
# tow.play

# Stores the player's inputs
class Player
  attr_accessor :user_input
end


class Board

  attr_accessor :toh

  def initialize(n)
    @toh = Array.new(3)
    @toh[0] = (1..n).to_a
    @toh[1], @toh[2] = [],[]
  end

  # Draw the current state of the board
  def render

    # Loop over each pin array.
    @toh.each do |pin|

      # Loop over each disk on the pins.

      if pin  
        pin.each do |disk|
          puts disk
        end
      end

    # End of pin.
    puts "--"
    end
  end
end

class TowerOfHanoi

  # attr_accessor :no_of_disks

  # Intialise the board
  def initialize(n)
    @no_of_disks = n
    @won = false
    @game_play = true
    @player = Player.new
    @board = Board.new(@no_of_disks)
  end

  def play
    puts "Welcome to Tower of Hanoi!"
    puts "Instructions:"
    puts "Enter where you'd like to move from and to"
    puts "in the format '1,3'. Enter 'q' to quit."

    while (@won != true && @game_play != false)   
      get_user_input
    end
  end

  def get_user_input

    # Show the current state of the board
    @board.render

    puts "Enter move >"
      
    @player.user_input = gets.chomp
    puts "user input is #{@player.user_input}"
    
    if(@player.user_input.include?(","))
      # puts "contains a comma"
      moves = @player.user_input.split(",")
      if(moves.length == 2)
        # puts "Correct number of arguments"
        move(moves[0].to_i, moves[1].to_i)
      else 
        help
        get_@player.user_input
      end
    elsif @player.user_input == "q"
        @game_play = false
        puts "Game over. See you next time!"
    else
      help
      get_user_input
    end
  end

  def help
    puts "Enter a move in the correct format 'num, num'"
    puts "Eg. 1,2"
  end


  # Check if the game was won
  def game_won
    won = true
    temp = 1

    if(@board.toh[0].empty? && @board.toh[1].empty?)
      if(@board.toh[2].length == @no_of_disks)
        @board.toh[2].each do |element|
          if element == temp
            temp+=1
          else
            won = false
            return won
          end
        end
      else
        won = false
        return won
      end
    else
      won = false
      return won
    end
  end

  # Move a disk from 1 pin to the other
  def move(from, to)
    if move_valid?(from, to)
      # puts "valid move"
      # puts "#{@board.toh}"

      from = from-1
      to = to-1

      disk = @board.toh[from].shift

      # puts "The disk we are moving #{disk}"

      if(@board.toh[to].empty?)
        @board.toh[to] = [disk]
        # puts "The to destination was empty"
      else
        @board.toh[to].unshift(disk)
      end

      puts "After change #{@board.toh}"

      # Check if that was the winning move
      if game_won
        @game_play = false
        puts "You won"
      end
    else
      puts "Invalid move. Please try again!"
    end
  end

  # Check if the move was valid
  def move_valid?(from, to)

    # puts "checking if the moves are valid"
    puts "moving from #{from} to #{to}"

    if((from.between?(1,3)) && (to.between?(1,3)))
      # puts "valid pin number"
      from = from-1
      to = to-1

      if(@board.toh[from].empty?)
        return false
      elsif(@board.toh[to].empty?)
        # puts "destination pin is empty"
        return true  
      elsif((@board.toh[from].first) < (@board.toh[to].first))
        # puts "#{@board.@toh[to].first} is less than #{@board.@toh[to].first} "
        return true
      else 
        return false
      end
    else false
    end
  end
 

  
end
