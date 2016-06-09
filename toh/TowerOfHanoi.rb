# This is the class for the main GAME

	require 'pry'


	require_relative 'Player'

	include Player




class TowerOfHanoi




	attr_accessor :disc_being_moved, :player_move
	attr_reader :towers, :victory

	def initialize( towers, victory, number_of_discs )

		@towers = towers
		@victory = victory
		@disc_being_moved = disc_being_moved
		@number_of_discs = number_of_discs
		@player_move = 3


	end




	def self.populate_tower( num_discs )

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


	def move_disc_to_tower

  	@towers[  player_move - 1  ] << @disc_being_moved

	end



	def remove_disc_from_tower

		@disc_being_moved = @towers[ @player_move - 1  ].pop

	end


	def tower_has_discs?

		if @towers[ @player_move - 1 ].empty?
			return false
		else
			return true
		end

	end





	def destination_disc_bigger?

		@disc_being_moved > @towers[ @player_move - 1 ].last

	end


end










### Start of the game ###
puts "Welcome to Tower of Hanoi"

puts "Please enter the number of discs to play with: "

# store player input to send to Player object
num_discs = get_input_or_exit

	# loop and call method checks in Player class to get valid number
	until valid_input?( num_discs )
		enter_valid_number("disc")
		num_discs = get_input_or_exit
	end

# create game and populate Tower with player selection
tower = TowerOfHanoi.populate_tower( num_discs )


until tower.victory == tower.towers

	system 'clear'
	# print out game field
	tower.display_towers

	# starting the input for removing the disc
	valid_move = false

	until valid_move

		puts "Please enter tower to move from:"

		tower.player_move = get_input_or_exit

		until valid_tower_choice?( tower.player_move ) &&
					tower.tower_has_discs?


			system 'clear'
			tower.display_towers

			enter_valid_number("from")

			tower.player_move = get_input_or_exit

		end

		tower.remove_disc_from_tower

		system 'clear'
		tower.display_towers

		valid_move = true


	end #/valid move removing disc





	# loop to control the placing of the disc
	valid_move = false

	until valid_move

		puts "Please enter tower to move to:"

		tower.player_move = get_input_or_exit

		# loop for picking a valid tower number
		until valid_tower_choice?( tower.player_move )

			system 'clear'
			tower.display_towers

			enter_valid_number( "to" )

			tower.player_move = get_input_or_exit

		end

		# loop for valid placement
		if tower.tower_has_discs? == false

			tower.move_disc_to_tower
			valid_move = true

		elsif tower.destination_disc_bigger?

			system 'clear'
			tower.display_towers

			disc_to_big

		else

			tower.move_disc_to_tower
			valid_move = true

		end


	end #/valid move placing disc


system 'clear'

puts "You Win! Nice work!"

tower.display_towers


end








