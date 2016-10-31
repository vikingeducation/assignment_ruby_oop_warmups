require './tower_render'
require './tower_model'

class TowerController

	def initialize(stack_size = 4)
		@game = TowerModel.new(stack_size)
	end

	# def play
	# 	RenderTower::welcome_message 
	# end


end

