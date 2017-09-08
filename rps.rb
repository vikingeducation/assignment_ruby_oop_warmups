OPTIONS = ['rock', 'paper', 'scissors']

class HumanPlayer 
  attr_accessor :name, :wins
  
  def move 
    puts "Rock, paper, or scissors?"
    @player_move = gets.chomp 
    
    while !OPTIONS.include?(@player_move.downcase)
      puts "Not an option; try again."
      puts "Rock, paper, or scissors?"
      @player_move = gets.chomp
    end
    @player_move
  end
end

class ComputerPlayer
  attr_accessor :name, :wins
  
  def move
    @computer_move = OPTIONS.sample
  end
  
  def display_move
    puts "Computer chooses #{@computer_move}"
  end
end

class PlayGame
  def initialize
    puts "**Welcome to Rock, Paper, scissors!**"
    puts "Enter 1 for one-player game, 2 for two-player game:"
    @game_type = gets.chomp.to_i 
    while ![1, 2].include?(@game_type)
      puts "Not an option; try again"
      @game_type = gets.chomp.to_i
    end
    
    @player1 = HumanPlayer.new
    
    if @game_type == 1
       @player2 = ComputerPlayer.new
    else
      @player2 = HumanPlayer.new
    end
  end
  
  def player1_move
    @player1_move = @player1.move
  end
  
  def player2_move
    @player2_move = @player2.move
  end
  
  def display_computer_move
    @player2.display_move
  end
  
  def compute_winner
    @player1_wins = false
    if @player1_move == "rock" && @player2_move == 'scissors'
      @player1_wins = true
    elsif @player1_move == 'paper' && @player2_move == 'rock'
      @player1_wins = true
    elsif @player1_move == 'scissors' && @player2_move == 'paper'
      @player1_wins = true
    elsif @player1_move == @player2_move
      @player1_wins = 'tie'
    end
    @player1_wins
  end
  
  def display_results
    if @player1_wins == 'tie'
      puts "It's a tie!"
    elsif @player1_wins == true && @game_type == 1
      puts "Human player wins!"
    elsif @player1_wins == false && @game_type == 1
      puts "Computer wins!"
    elsif @player1_wins == true && @game_type == 2
      puts "Player 1 wins!"
    else 
      puts "Player 2 wins!"
    end
  end 

  def play_again
    puts "Play again? Enter 'yes' to continue, 'no' to quit:"
    repeat_game = gets.chomp.downcase
    while !['yes', 'no'].include?(repeat_game)
      puts "Invalid entry"
      puts "Play again? Enter 'yes' to continue, 'no' to quit:"
      repeat_game = gets.chomp.downcase
    end
    repeat_game
  end
  
  def play 
    loop do
      player1_move
      system("clear") if @game_type == 2
      player2_move
      display_computer_move if @game_type == 1
      compute_winner
      display_results
      break if play_again == 'no'
    end
  end
end

game = PlayGame.new
game.play