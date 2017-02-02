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
  QUIT_OPTIONS = ["q", "quit", "exit"]

  attr_accessor :player1, :player2, :single_player, :wins_required

  def initialize(single_player = true, wins_required = 3)
    @single_player = single_player
    @wins_required = wins_required

    @player1 = Player.new

    if single_player
      @player2 = Computer.new
    else
      @player2 = Player.new
    end
  end

  # main game loop
  def play
    begin
      # print instructions and intro
      display_instructions
      check_if_two_players

      # get player names
      player1.name = get_player_name(1)
      player2.name = get_player_name(2) unless single_player
      puts
    
      until game_over?
        # get player1's move
        player1.move = get_next_move(player1).downcase

        # quit game if player wants to do so
        exit_game if QUIT_OPTIONS.include?(player1.move)


        if single_player
          # computer makes its move
          player2.make_move
        else
          # human player2 makes his move
          player2.move = get_next_move(player2).downcase

          # quit game if player wants to do so
          exit_game if QUIT_OPTIONS.include?(player2.move)
        end

        display_moves
        winner = round_winner
        display_round_winner(winner)
        increment_score(winner)
        display_scores
      end

      congratulate(game_winner)
    rescue SystemExit, Interrupt
      puts
      exit_game
    end
  end

  # gets player name
  def get_player_name(player_number)
    print "Player #{player_number}, please enter your name: "
    gets.chomp
  end

  # gets the next move/input of a human player
  def get_next_move(player)
    loop do
      print "Enter your move, #{player.name}: "
      input = gets.chomp

      if valid_move?(input)
        return input
      else
        puts "Invalid move. Please try again."
      end
    end
  end

  # checks if a move is valid, or if player wants to quit
  def valid_move?(move)
    VALID_MOVES.include?(move.downcase) || QUIT_OPTIONS.include?(move.downcase)
  end

  # displays the current moves of each player
  def display_moves
    puts "Player 1 (#{player1.name}) makes his move: #{player1.move}!"
    puts "Player 2 (#{player2.name}) makes his move: #{player2.move}!"
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

  # displays the winner of a round
  def display_round_winner(player)
    unless player.nil?
      puts "#{player.name} won this round!"
    else
      puts "It's a tie!"
    end
  end

  # increments the score of the winner of a round,
  # unless it's a tie
  def increment_score(player)
    player.score += 1 unless player.nil?
  end

  # prints the current scores of both players
  def display_scores
    puts "** Current score **"
    puts "Player 1 (#{player1.name}): #{player1.score}"
    puts "Player 2 (#{player2.name}): #{player2.score}"
    puts
  end

  # checks if game is over
  def game_over?
    player1.score == wins_required || player2.score == wins_required
  end

  # checks who won the game
  def game_winner
    player1.score > player2.score ? player1 : player2
  end

  # prints a congratulatory message for the winner
  def congratulate(winner)
    puts "Congratulations, #{winner.name}! You won!"
  end

  # display intro and instructions
  def display_instructions
    puts "Welcome to Rock Paper Scissors!"
    puts
    puts "We'll play until someone has won #{wins_required} times."
    puts "Each round, please enter either 'rock', 'paper', or 'scissors'."
    puts "Enter 'quit' to quit."
    puts
  end

  def check_if_two_players
    print "Are there two players? (y/n) "

    response = gets.chomp.downcase

    @single_player = false if response == "y"
  end

  # quits game
  def exit_game
    puts "Goodbye!"
    exit
  end
end



class Player
  attr_accessor :name, :score, :move

  def initialize(name = "Derp")
    @name = name
    @score = 0
    @move = ""
  end
end



class Computer
  attr_accessor :name, :score, :move

  def initialize
    @name = "RPS Bot"
    @score = 0
    @move = ""
  end

  # gets computer to make a random move
  def make_move
    @move = ["rock", "paper", "scissors"].sample
  end
end



if $0 == __FILE__
  rps = RockPaperScissors.new
  rps.play
end