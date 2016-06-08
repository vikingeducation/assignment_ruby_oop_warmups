# This is the class for the main GAME

	require 'pry'

	require_relative 'Tower'
	require_relative 'MoveChecker'
	require_relative 'Player'

	include MoveChecker
	include Tower
	include Player

class TowerOfHanoi




	attr_accessor :player_move, :number_of_discs,
								:disc_being_moved

	def initialize( towers, victory, num_discs )

		@towers = towers
		@victory = victory
		@player_move = player_move
		@num_discs = num_discs
		@disc_being_moved = disc_being_moved


	end

	def self.populate_tower( num_discs )

		towers = { 0 => ( ( 1..num_discs).to_a.reverse ), 1 => [], 2 => [] }

		victory = { 0 => [], 1 => [], 2 => ( (1..num_discs ).to_a.reverse ) }

		TowerOfHanoi.new( towers, victory, num_discs )

	end



	def game_loop

		until @towers == @victory

			display_towers





			valid_move = false


			until valid_move do

				# print tower hash so player can see status


				prompt_from

				# player inputs which tower they want to move from
				@player_move = get_player_move


				# call the valid? method to make sure the selection is in range of the number of towers available
				if valid_tower_choice?( @player_move )

					# if the tower they want to move from has discs in it they can make a move
					if check_if_empty?

						# change the variable to true to exit the while loop
						valid_move = true

						# with the correct tower selected the disc is removed from the corresponding tower stored in the disc_being_moved var and removed from the towers array with POP
						move( "from" )
					# otherwise they need to select the right tower
					else

						invalid_move( "empty" )

					end

				# otherwise they need to select the right tower
				else

					invalid_move( "default" )

				end

			end #/.While Loop for checking for a valid move from the tower

		  #then ask which tower to move to
		  prompt_to
		  @player_move = get_player_move




		  if valid_tower_choice?( @player_move )




		  end # /valid_tower_choice



		end

	end


end


### Start of the game ###
puts "Welcome to Tower of Hanoi"

num_discs = valid_choice_to_start?

new_game = TowerOfHanoi.populate_tower( num_discs )

new_game.game_loop







