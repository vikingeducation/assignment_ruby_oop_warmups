
# This will be the module that checks the inputs from the player
# MoveChecker will check for...
	# valid disc selection to start with
	# valid tower choices for each move
	# if the player wishes to exit
	# if the player won


module MoveChecker



	def valid_choice_to_start?

		correct_selection = false

		until correct_selection
			puts "Please enter number of discs to start:"

			num_discs = gets.strip

			if num_discs.downcase == "exit"

				exit

			elsif num_discs.to_i <= 0

				puts "Please enter a valid number"

			else

				return num_discs.to_i

			end

		end

	end


	def valid_tower_choice?( tower_choice )

		(1..3) === tower_choice

	end


	def check_if_empty

			if @towers[ ( @player_move - 1 ) ].empty?

				invalid_move( "empty" )
				get_player_move

			else

					move("from")

			end

	end


	def valid_move_to



	end




	def invalid_move( error )

		system 'clear'
		case error
		when "empty"
			puts "That tower is empty, please select another"
		when "too small"
			puts  "The disc must be bigger than the disc your moving"
		end


	end


end # /MoveChecker Module