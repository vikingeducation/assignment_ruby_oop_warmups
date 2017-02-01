# Rock Paper Scissors

# Classes required:

# 1. A RockPaperScissors class - each instance represents a game of RPS
# 2. A Player class - each instance represents a human player
# 3. A Computer class - each instance represents a computer player

# Methods required:
# 1. RockPaperScissors class:
# - method to check if game is over
# - method to check if a game is single-player or two-player
# - method to check who won in a given round
# - method to quit game
# - method to restart game
# - method to display current score
# - method to display instructions
# - method to display who won if game is over
# - method to play game
# - method for players to enter their name when the game starts
# - method to check if a move provided by a human player is valid

# 2. Player class:
# - method to get input from player

# 3. Computer class:
# - method to randomly generate move

# Pseudocode:

# 1. Prompt player to make a move.
# 2. Check whether the move is one of rock, paper, or scissors.
# 3. Retry if it's not.
# 4. Computer makes a random selection from rock, paper, or scissors.
# 5. Check whether the player or computer wins this round.
# 6. If it's a tie, repeat steps 1 to 5.
# 7. Repeat the above until the desired number of rounds are met, or the player decides to quit.

class RockPaperScissors
  VALID_MOVES = ["rock", "paper", "scissors"]

  attr_accessor :player1, :player2, :single_player, :wins_required

  def initialize(single_player = true, wins_required = 3)
    @single_player = single_player
    @wins_required = wins_required

    # @player1 = Player.new(player_name(1))
    @player1 = Player.new("Erik")

    if single_player
      @player2 = Computer.new
    else
      @player2 = Player.new(player_name(2))
    end
  end

  # main game loop
  def play

  end

  # checks who won a given round
  def round_winner
    if player1.move == "rock"
      return player1 if player2.move == "scissors"
      return player2 if player2.move == "paper"
      return nil
    end

    if player1.move == "paper"
      return player1 if player2.move == "rock"
      return player2 if player2.move == "scissors"
      return nil
    end

    if player1.move == "scissors"
      return player1 if player2.move == "paper"
      return player2 if player2.move == "rock"
      return nil
    end
  end

  # checks if a move is valid
  def valid_move?(move)
    VALID_MOVES.include?(move.downcase)
  end

  # gets player name
  def player_name(player_number)
    print "Player #{player_number}, please enter your name: "
    name = gets.chomp
  end

  # prints the current scores of both players
  def current_scores
    puts "** Current score **"
    puts "Player 1: #{player1.score}"
    puts "Player 2: #{player2.score}"
  end

  # checks if game is over
  def game_over?
    player1.score == wins_required || player2.score == wins_required
  end

  # checks who won
  def winner
    player1.score > player2.score ? player1 : player2
  end

  # prints a congratulatory message for the winner
  def congratulate
    puts "Congratulations, #{winner.name}! You won!"
  end
end



class Player
  attr_accessor :name, :score, :move

  def initialize(name = "Derp", score = 0)
    @name = name
    @score = score
    @move = ""
  end

  def make_move
    print "Please enter your move: "
    @move = gets.chomp
  end
end



class Computer
  attr_accessor :name, :score, :move

  def initialize
    @name = "RPS Bot"
    @score = 0
    @move = ""
  end

  def make_move(moves)
    @move = moves.sample
  end
end



if $0 == __FILE__
  rps = RockPaperScissors.new
  rps.play
end