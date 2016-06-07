# This is the class for the main GAME

	require 'pry'

	require_relative 'Tower'
	require_relative 'MoveChecker'

	include MoveChecker
	include Tower

class TowerOfHanoi




	attr_accessor :player_move, :number_of_discs

	def initialize( towers, victory, num_discs )

		@towers = towers
		@victory = victory
		@player_move = player_move
		@num_discs = num_discs

	end

	def self.populate_tower( num_discs )

		towers = { 0 => ( ( 1..num_discs).to_a.reverse ), 1 => [], 2 => [] }

		victory = { 0 => [], 1 => [], 2 => ( (1..num_discs ).to_a.reverse ) }

		TowerOfHanoi.new( towers, victory, num_discs )

	end



end


### Start of the game ###
puts "Welcome to Tower of Hanoi"

num_discs = valid_choice_to_start?

new_game = TowerOfHanoi.populate_tower(num_discs)

new_game.display_towers







