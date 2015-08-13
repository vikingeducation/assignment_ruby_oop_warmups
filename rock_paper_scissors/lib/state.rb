class State
	attr_accessor :game, :template

	def initialize
		@game = nil
	end

	def update(game)
		@game = game
		route
	end

	def route
		if selecting_players?
			@game.controller.select_players(@game)
		elsif playing?
			@game.controller.take_turn(@game)
		elsif game_over?
			@game.controller.end_game(@game)
		end
	end

	def selecting_players?
		@game.num_players.to_i < 1 || @game.player_one == nil || @game.player_two == nil
	end

	def playing?
		! selecting_players? && ! game_over?
	end

	def game_over?
		@game.turn >= 2 && @game.player_one.hand && @game.player_two.hand
	end

	def quitting?
		['q', 'quit', 'exit'].include?(@game.input)
	end
end