require './tower_render'
require './tower_model'

class TowerController

	def initialize(stack_size = 4)
		@game = TowerModel.new(stack_size)
    TowerRender.welcome_message(stack_size)
  end

  def move_piece plate, target
    @game.gameboard[target-1] << @game.gameboard[plate-1].pop
    
  end
	
  def play
    TowerRender.pickup_line
    current_move = gets.chomp
    TowerRender.putdown_line
    target = gets.chomp
    move_piece current_move, target
    TowerRender.render @game.gameboard, @game.stack_size
	end


end

t = TowerController.new

t.play
