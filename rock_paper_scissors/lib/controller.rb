class Controller
	def select_players(game)
		input = game.input.to_i
		template = :select_players
		if game.auth.valid_player_number?(input)
			game.num_players = input
			game.player_one = Player.new
			game.player_two = (input == 1) ? AI.new : Player.new
			template = :play
		else
			game.view.notice = "Invalid number of players"
		end
		game.view.template = template
	end

	def take_turn(game)
		input = game.input.to_i
		if game.auth.valid_hand?(input)
			hand = game.to_hand(input)
			if game.turn == 0
				game.player_one.hand = hand
			elsif game.turn == 1
				game.player_two.hand = hand
			end
			game.turn += 1
		else
			game.view.notice = "Invalid hand"
		end
	end

	def end_game(game)
		game.view.template = :game_over
	end
end