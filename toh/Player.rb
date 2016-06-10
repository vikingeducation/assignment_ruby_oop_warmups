
class Player

	attr_accessor :player_move
	attr_writer :number_of_discs

	def initialize

		@player_move = 3

		new_game

	end


	def new_game


		puts "Welcome to Tower of Hanoi"

		puts "Please enter the number of discs to play with: "

		@number_of_discs = @player.get_input_or_exit

			until @player.valid_input?( @number_of_discs )

				@player.enter_valid_number("disc")

				@number_of_discs = @player.get_input_or_exit

			end

		TowerOfHanoi.populate_tower( @number_of_discs )

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