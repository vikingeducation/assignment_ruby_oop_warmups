#Main Game - Tower of Hanoi
require 'pry'


class TowerOfHanoi

  attr_accessor :disc_being_moved
  attr_reader :number_of_discs

	def initialize( towers = nil, victory = nil, num_discs = 0 )

		@towers = towers
		@victory = victory
		@disc_being_moved = disc_being_moved
		@number_of_discs = number_of_discs

		@player = Player.new

	end


	def populate_tower( num_discs )

		@number_of_discs = num_discs

		@towers = { 0 => ( ( 1..@number_of_discs).to_a.reverse ), 1 => [], 2 => [] }

		@victory = { 0 => [], 1 => [], 2 => ( (1..@number_of_discs ).to_a.reverse ) }

	end


	def display_towers
			@towers.each do |k, v|

					print "Tower #{k+1}"
					puts  ""
					puts  ""

					v.reverse.each { | n |	puts "#{'O' * n }" }

					print "#{'-' * @number_of_discs}"

					puts  ""

				end
	end



	def move_disc_to_tower

  	@towers[  @player_move - 1  ] << @disc_being_moved

	end



	def remove_disc_from_tower

		@disc_being_moved = @towers[ @player_move - 1  ].pop

	end



	def tower_has_discs?

		@towers[ @player_move - 1 ].empty? ? false : true


	end


	def destination_disc_bigger?

		@disc_being_moved > @towers[ @player_move - 1 ].last

	end



	def start

		until @victory == @towers

			system 'clear'
			display_towers



			valid_move = false

			until valid_move

				puts "Please enter tower to move from:"

				@player_move = get_input_or_exit

				until valid_tower_choice?( @player_move ) &&
							tower_has_discs?

					system 'clear'
					display_towers

					enter_valid_number("from")

					@player_move = get_input_or_exit

				end

				remove_disc_from_tower

				system 'clear'
				display_towers

				valid_move = true


			end #/valid move removing disc




			valid_move = false

			until valid_move

				puts "Please enter tower to move to:"

				@player_move = get_input_or_exit

				until valid_tower_choice?( @player_move )

					system 'clear'
					display_towers

					enter_valid_number( "to" )

					@player_move = get_input_or_exit

				end

				if tower_has_discs? == false

					move_disc_to_tower
					valid_move = true

				elsif destination_disc_bigger?

					system 'clear'
					display_towers

					disc_to_big

				else

					move_disc_to_tower
					valid_move = true

				end


			end #/valid move placing disc

		# reset the view
		system 'clear'

		puts "You Win! Nice work!"

		display_towers


		end


	end


end #/Class TOH



class Player < TowerOfHanoi

	attr_accessor :player_move
	attr_writer :number_of_discs

	def initialize

		@player_move = 3

		new_game

	end




	def new_game


		puts "Welcome to Tower of Hanoi"

		puts "Please enter the number of discs to play with: "

		num = get_input_or_exit

			until valid_input?( num )

				enter_valid_number("disc")

				num = get_input_or_exit

			end

			populate_tower( num )
			start

	end





	def get_input_or_exit

			@player_move = gets.strip

			if @player_move.downcase == "exit"
				exit
			else
				return @player_move.to_i
			end

	end




	def enter_valid_number( error )

		if error == "disc"

			puts "Please enter a valid disc number:"

		else

			puts "Enter a valid number to move #{ error }:"

		end

	end




	def disc_to_big

		puts "Your disc is too big, please select another tower"

	end






  def valid_input?( input )

  	input > 0

  end



  def valid_tower_choice?( input )

  	(1..3) === input

  end






end




game = TowerOfHanoi.new

game.start





