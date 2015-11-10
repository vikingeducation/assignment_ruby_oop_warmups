require_relative 'rps_player'
require_relative 'rps_computer'

class RockPaperScissor
  @@move_lookup = {'r' => 'rock', 'p' => 'paper', 's' => 'scissors'}

  def initialize mode="AI"
    puts "***************************************"
    puts "** Welcome to Rock, Paper, Scissors! **"
    puts "***************************************"
    select_mode
  end

  def play
    loop do
      @player1.select_move
      @player2.select_move

      if @player1.move == @player2.move
        puts "It's a draw!  Let's try again!"
        play
      elsif player1_win?
        puts "#{@player1.name} WINS with #{@@move_lookup[@player1.move].upcase} beating #{@player2.name}'s #{@@move_lookup[@player2.move].upcase}!"
      else
        puts "#{@player2.name} WINS with #{@@move_lookup[@player2.move].upcase} beating #{@player1.name}'s #{@@move_lookup[@player1.move].upcase}."
      end
      break if quit?
    end
  end

  private

  def select_mode
    puts "Type 1 for 1 player or 2 for 2 players"
    print " > "
    players = gets.chomp.to_i
    @player1 = RPSPlayer.new
    if players == 1
      @player2 = RPSComputer.new
    elsif players == 2
      @player2 = RPSPlayer.new
    else
      puts "I'm sorry I didn't recognize your input. Try again..."
      select_mode
    end
  end

  def player1_win?
    winners = [['r', 's'], ['p', 'r'], ['s', 'p']]
    winners.include? [@player1.move, @player2.move]
  end

  def quit?
    puts "Would you like to play again? (y/n)"
    gets.chomp.downcase != 'y'
  end

end

# game = RockPaperScissor.new
# game.play