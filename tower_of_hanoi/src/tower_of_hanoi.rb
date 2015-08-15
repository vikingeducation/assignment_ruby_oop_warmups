require_relative 'lib/app.rb'
require_relative 'game_controller.rb'
require_relative 'game_model.rb'
require_relative 'game_auth.rb'

class TowerOfHanoi < App
	def initialize
		super(
			:controller => 'GameController',
			:model => 'GameModel',
			:views => 'views',
			:action => :menu
		)
	end
end