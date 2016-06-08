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



			prompt_from
		  @player_move = get_player_move

		  if valid_tower_choice?( @player_move )

		  	check_if_empty

		  end

		  #then ask which tower to move to
		  prompt_to
		  @player_move = get_player_move

		  if valid_tower_choice?( @player_move )

		  	if

		  	valid_move_to

		  end


		end

	end


end


### Start of the game ###
puts "Welcome to Tower of Hanoi"

num_discs = valid_choice_to_start?

new_game = TowerOfHanoi.populate_tower( num_discs )

new_game.game_loop







