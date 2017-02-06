require_relative 'player.rb'
require_relative 'computer_player.rb'
require_relative 'rock.rb'
require_relative 'paper.rb'
require_relative 'scissors.rb'

class Game
  def initialize(player_one="Player 1", player_two="Player 2", vs_computer?=true)
    @player_one = Player.new(player_one)

    if vs_computer?
      @player_two = ComputerPlayer.new(player_two)
    else
      @player_two = Player.new(player_two)
    end
  end

  def play
    @player_one.choose_move
    @player_two.choose_move
    puts winner
  end

  def winner
    move_one = @player_one.move
    move_two = @player_two.move

    if move_one.beats?(move_two)
      @player_one.name
    else
      @player_two.name
    end
  end

end