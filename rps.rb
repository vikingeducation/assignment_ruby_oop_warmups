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
    @human_player = HumanPlayer.new 
    @computer_player = ComputerPlayer.new
    puts "**Welcome to Rock, Paper, scissors!**"
  end
  
  def player_move
    @human_move = @human_player.move 
  end
  
  def computer_move
    @computer_move = @computer_player.move
  end
  
  def display_computer_move
    @computer_player.display_move
  end
  
  def compute_winner
    @player_wins = false
    if @human_move == "rock" && @computer_move == 'scissors'
      @player_wins = true
    elsif @human_move == 'paper' && @computer_move == 'rock'
      @player_wins = true
    elsif @human_move == 'scissors' && @computer_move == 'paper'
      @player_wins = true
    elsif @human_move == @computer_move
      @player_wins = 'tie'
    end
  end
  
  def display_results
    if @player_wins == 'tie'
      puts "It's a tie!"
    elsif @player_wins
      puts "Human player wins!"
    else
      puts "Computer wins!"
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
      player_move
      computer_move
      display_computer_move
      compute_winner
      display_results
      break if play_again == 'no'
    end
  end
end

game = PlayGame.new
game.play