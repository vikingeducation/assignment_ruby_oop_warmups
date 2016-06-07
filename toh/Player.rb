# PLAYER CLASS
# This class takes in the player input
# Players can
	# Select the number of discs to start
	# Make their moves and select tower
	# choose to exit at any point

	class Player

		attr_accessor :from_tower, :to_tower

		def initialize( number_of_discs )

			@number_of_discs = number_of_discs
			@from_tower = from_tower
			@to_tower = to_tower

		end

		#select the number of discs
		def number_of_discs_to_start
		end

		#make a move from-to tower [array]
		def move
		end


		#exiting the game
		def player_exit?
		end


	end

