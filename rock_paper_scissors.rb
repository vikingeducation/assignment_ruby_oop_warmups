
# Create a command line Rock-Paper-Scissors game, starting with one player against the computer. Think through what you need beforehand and write it down. What classes do you need? What methods? Then get started.

# Start with one player against the computer and then add 2-player mode.\

# To run this create a new Game object
# game = Game.new
# game.play

require 'pry'


class Player
  # store the users answer

  attr_accessor :status

  def play_again?(input)
    @status = (input.strip.downcase == "n") ? false : true
  end
end


class Computer
  # Generate a random number to indicate the random item
  def random_move
    1 + rand(3)
  end

end

# All the actions relevant to the game
class Game

  attr_accessor :no_players, :player1, :player2, :p1_input, :p2_input

  def initialize
    # initialize the item options as 1,2,3
    @items = {1=>"rock", 2=>"paper", 3=> "scissors"}
    @game_play = true
  end

  def who_won(player1, player2)
    if (player1 == 1 and player2 == 2)
      result = "Player 2 won"
    elsif (player1 == 1 and player2 == 3)
      result = "Player 1 won"
    elsif (player1 == 2 and player2 == 1)
      result = "Player 1 won"
    elsif (player1 == 2 and player2 == 3)
      result = "Player 2 wins"
    elsif (player1 == 3 and player2 == 1)
      result = "Player 2 wins" 
    elsif (player1 == 3 and player2 == 2)
      result = "Player 1 wins"
    else
      result = "That was a draw"
    end
    result
  end

  def select_move
    # binding.pry 
    puts "Player 1 enter move >"  
    @p1_input = gets.chomp.strip.to_i

    puts "Player 1 chose #{@p1_input} - #{@items[@p1_input]}"
    puts "============================================================"
    # if(p1_input.size == 1)
    #   @p1_input = @p1_input.to_i
    # end

    if(@no_players == 1)
      @p2_input = @player2.random_move
      puts "Player 2 chose #{@p2_input} - #{@items[@p2_input]}"
    else
      puts "Player 2 enter move >"  
      @p2_input = gets.chomp.strip.to_i
      puts "Player 2 chose #{@p2_input} - #{@items[@p2_input]}"
    end

    puts "============================================================"

    player_won = who_won(@p1_input, @p2_input)
    puts "#{player_won}"
    puts "============================================================"
    puts "Do you want to play again?"
    puts "Y for yes"
    puts "N for no"
    
    user_input = gets.chomp.strip
    @game_play = @player1.play_again?(user_input)

    if @game_play
      select_move
    else 
      puts "Game over. Thanks for playing!"
    end
  end

  def play
    puts "Hello, Let's play rock, paper, scissors!"
    puts "============================================================"
    puts "Instructions:"
    puts "Enter the number of players 1 or 2, if you enter 1 you will play aginst the master computer"
     
    @no_players = gets.chomp.strip.to_i
    
    if(@no_players == 1)
      @player1 = Player.new
      @player2 = Computer.new
    else
      @player1 = Player.new
      @player2 = Player.new
    end

    puts "You have chosen #{@no_players} player(s)"
    puts "Enter 1 for Rock"
    puts "Enter 2 for Paper"
    puts "Enter 3 for Scissors"
    puts "============================================================"

    while (@game_play != false) 
      select_move
    end
  end
end