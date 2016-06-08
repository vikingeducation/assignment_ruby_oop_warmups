
class Player

	attr_accessor :player_move

	def initialize
		@player_move = player_move
	end


	def get_input_or_exit

			num = gets.strip

			if num.downcase == "exit"
				exit
			else
				return num.to_i
			end

	end


	def enter_valid_number

		puts "Enter a valid number"

	end



  def valid_input?( input )

  	input > 0

  end


	def move_input
	end




end