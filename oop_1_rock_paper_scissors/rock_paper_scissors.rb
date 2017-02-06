require_relative 'player.rb'
require_relative 'computer_player.rb'
require_relative 'rock.rb'
require_relative 'paper.rb'
require_relative 'scissors.rb'

class RockPaperScissors
  def initialize(player_one="Player 1", player_two="Player 2", vs_computer=true)
    @player_one = Player.new(player_one)

    if vs_computer
      @player_two = ComputerPlayer.new(player_two)
    else
      @player_two = Player.new(player_two)
    end
  end

  def play
    puts "#{@player_one.name}, it's your turn." unless @player_two.class == ComputerPlayer
    @player_one.choose_move

    puts "#{@player_two.name}, it's your turn." unless @player_two.class == ComputerPlayer
    @player_two.choose_move

    puts "#{@player_one.name} chose #{@player_one.move.class}."
    puts "#{@player_two.name} chose #{@player_two.move.class}."

    if winner == "Draw"
      puts "The game is a draw."
    else
      puts "The winner is #{winner}."
    end
  end

  def winner
    move_one = @player_one.move
    move_two = @player_two.move

    if move_one.class == move_two.class
      "Draw"
    elsif move_one.beats?(move_two)
      @player_one.name
    else
      @player_two.name
    end
  end

end