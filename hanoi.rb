=begin
	-Class for entering the height and initializing data structure
	-Class displaying board
	-Class holding main that loops through moves
	   method to check if the game is over
	-Class for validation
	  validates entered move ( tower - 1,2,3)
	  validates disk_movemnt (can disk move)
	-Class for making the move
=end

class Toh
	def main
		height = HeightOfTower.new
		t1 = height.tower1
		t2 = height.tower2
		t3 = height.tower3
		show = Display.new
		show.create_display(t1,t2,t3)
	end
end

class HeightOfTower
	attr_accessor :tower1, :tower2, :tower3
	def initialize
		puts "What is the height of your tower?"
		height = gets.chomp
		@tower1 = (1..height.to_i).to_a
		@tower2 = []
		@tower3 = []
	end
end

class Display
	def create_display(t1,t2,t3)
		arr = [t1, t2, t3]
		

	end
end

class Validate

end

class Move

end