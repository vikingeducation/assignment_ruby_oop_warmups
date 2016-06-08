# This is the class for the main GAME

	require 'pry'


	require_relative 'Player'


class TowerOfHanoi


	attr_accessor :disc_being_moved

	def initialize( towers, victory, number_of_discs )

		@towers = towers
		@victory = victory
		@disc_being_moved = disc_being_moved
		@number_of_discs = number_of_discs


	end



	def self.populate_tower( num_discs )
binding.pry
		towers = { 0 => ( ( 1..num_discs).to_a.reverse ), 1 => [], 2 => [] }

		victory = { 0 => [], 1 => [], 2 => ( (1..num_discs ).to_a.reverse ) }

		TowerOfHanoi.new( towers, victory, num_discs )

	end


	def display_towers
			# runs through the hash to print a visual represenation of the towers
			@towers.each do |k, v|

					# lists the tower # and some space for readability
					print "Tower #{k+1}"
					puts  ""
					puts  ""

					# reverse the array to print smallest to largest and iterate through each array item in order to conver to treat each as an integer // otherwise it will treat as an array and ERROR
					v.reverse.each { | n |	puts "#{'O' * n }" }

					# prints a divider below each tower printout
					print "#{'-' * @number_of_discs}"

					puts  ""

				end
	end


end


### Start of the game ###
puts "Welcome to Tower of Hanoi"

new_player = Player.new

puts "Please enter the number of discs to play with: "

num_discs = new_player.get_input_or_exit

until new_player.valid_input?( num_discs )
	new_player.enter_valid_number
	num_discs = new_player.get_input_or_exit
end


new_game = TowerOfHanoi.populate_tower( num_discs )

new_game.display_towers






