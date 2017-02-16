
class Computer
	attr_reader :choice
	def initialize
		@choice = nil
	end

	# Randomly choose rock, paper, scissors
	def choose
		num = rand(1..3)
		if num == 1
			@choice = "r"
		elsif num == 2
			@choice = "p"
		else
			@choice = "s"
		end
	end
end
