
module Player


	def get_input_or_exit

			num = gets.strip

			if num.downcase == "exit"
				exit
			else
				return num.to_i
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