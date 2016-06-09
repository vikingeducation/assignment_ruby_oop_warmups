
module Player


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



  def valid_tower_choice?( input )

  	(1..3) === input

  end






end