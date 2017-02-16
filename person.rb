
class Person
	attr_reader :choice
	def initalize
		@choice = nil
	end

	# User picks rock, paper, or scissors
	def pick
		ask_pick
		@choice = gets.chomp
		# Keep calling pick method if user input is invalid
		if !valid?  
			input_error
			pick
		end
	end

	def ask_pick
		puts "Pick 'r' for rock, 'p' for paper, 's' for scissors!"
	end

	def input_error
		puts "Invalid input! Choose 'r', 'p', or 's'!"
	end
	
	# Checks to see if user input is valid
	def valid?
		@choice == "p" || @choice == "r" || @choice == "s"
	end
end
