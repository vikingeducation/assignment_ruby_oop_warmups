require 'io/console'
require './player'

require 'pry'

class RPSgame
  def initialize
    @player1 = Player.new('human')
    @player2 = nil
  end

  def play
    display_welcome
    ask_for_nickname(1)  # for player 1
    ask_for_game_mode
    ask_for_nickname(2) if @player2.player_type == 'human'  # for player 2 (if human)
    display_instructions
    input = 'y'
    while input == 'y'
      start_new_game
      if @player2.player_type == 'computer' 
        move1 = @player1.get_move 
      else
        move1 = @player1.get_move('hidden') 
      end
      quit_game if move1 == 'q'
      move2 = @player2.get_move
      quit_game if move2 == 'q'
      display_move(@player1.nickname, move1)
      display_move(@player2.nickname, move2)
      display_result(@player1.nickname, @player2.nickname, move1, move2)
      input = ask_to_play_again
    end
  end 

  private 

  def display_welcome
    puts "Welcome to Rock, Papers, and Scissors!"
    puts "You can quit the program at anytime by entering 'q'."
  end

  def ask_for_nickname(player)
    puts "Player 2," if player == 2
    puts "Please enter a nickname (10 characters max):"
    input = gets.chomp
    until input.length <= 10
      puts "Nickname must be 10 characters or less!"
      input = gets.chomp
    end
    quit_game if input == 'q'
    @player1.nickname = input if player == 1
    @player2.nickname = input if player == 2
  end

  def ask_for_game_mode
    puts "Enter '1' to play against the computer or '2' to play against someone else:"
    input = gets.chomp
    until input == '1' || input == '2'
      quit_game if input == 'q'
      puts "Invalid game mode! Please enter '1' or '2'."
      input = gets.chomp
    end
    input == '1' ? @player2 = Player.new('computer', 'The computer') : @player2 = Player.new('human')
  end

  def display_instructions
    puts "Instructions:"
    puts "Enter 'r' for rock, 'p' for paper, or 's' for scissors."
  end

  def start_new_game
    puts "Starting a new game now..."
  end

  def display_move(player_nickname, move)
    puts "#{player_nickname} has selected #{move_in_words(move)}!"
  end

  def move_in_words(move)
    case move
    when 'r'
      'rock'
    when 'p'
      'paper'
    when 's'
      'scissors'
    end
  end

  def result(move1, move2)
    win = [['r', 's'], ['p', 'r'], ['s', 'p']]
    return 'tie' if move1 == move2
    return 'win' if win.include?([move1, move2])
    'lose'
  end

  def display_result(player1, player2, move1, move2)
    case result(move1, move2)
    when 'tie'
      puts "It's a tie!"
    when 'win'
      puts "#{player1} wins!"
    when 'lose'
      puts "#{player2} wins!"
    end
  end

  def ask_to_play_again
    puts "Do you want to play again? (y|n)"
    input = gets.chomp
    until input == 'y'
      quit_game if input == 'n' || input == 'q'
      puts "Please enter 'y' or 'n'."
      input = gets.chomp
    end
    input
  end

  def quit_game
    puts "Thanks for playing!"
    puts "Exiting now..."
    exit
  end
end

# load './rps_game.rb'
# game = RPSgame.new
# game.play
