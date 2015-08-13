class Player
	attr_accessor :hand
end

class AI < Player
	def random
		@hand = [Rock.new, Paper.new, Scissors.new].shuffle[rand(3)]
	end
end