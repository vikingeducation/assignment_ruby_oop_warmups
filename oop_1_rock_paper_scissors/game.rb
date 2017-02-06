require_relative 'player.rb'
require_relative 'rock.rb'
require_relative 'paper.rb'
require_relative 'scissors.rb'

class Game
  def initialize(player_one, player_two)
    @player_one = player_one
    @player_two = player_two
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

