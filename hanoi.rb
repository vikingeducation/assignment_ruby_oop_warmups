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
		tower = height.tower
		show = Display.new
		show.create_display(tower)
	end
end

class HeightOfTower
	attr_accessor :tower
	def initialize
		puts "What is the height of your tower?"
		height = gets.chomp
		@tower = {:t1 => (1..height.to_i).to_a, :t2 => [], :t3 => []}
	end
end

class Display
	def create_display(tower)
		tower.each do |tower_no, height|
			for i in 0...height.length
			    print "o" * height[i]
			    puts ""
			end
			puts ""
		end
	end
end

class Validate

end

class Move

end