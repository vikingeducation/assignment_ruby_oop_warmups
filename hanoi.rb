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
    	move = Validate.new(tower)
      	
      	move.move_choice

	end
end

class HeightOfTower
	attr_accessor :tower
	def initialize
		puts "What is the height of your tower?"
		height = gets.chomp
		@tower = {"t1" => (1..height.to_i).to_a, "t2" => [], "t3" => []}
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

   def initialize(tower)
      @tower = tower
   end

   def move_choice
   	@entered = []
   	valid_move = false
    until (valid_entry? && valid_move)
      puts "Please enter your move in [from , to]"
      @entered = gets.chomp.split(",").map{|x| x.to_i}
      valid_move = valid_move?
      # puts @entered
      # puts valid_entry?
      # puts valid_move?
    end
   end

    def valid_entry?
      @entered.all?{|x| (1..3).include?(x)}
    end

    def valid_move?
    	# p @tower["t1"].empty?
    	# puts @tower["t2"]
    	# p @tower["t3"].empty?
    	# p @tower["t#{@entered[0]}"]
    	# p @entered
      if @tower["t#{@entered[0]}"].empty?
      	return false
      elsif @tower["t#{@entered[1]}"].empty?
      	return true
      elsif @tower["t#{@entered[0]}"][0] > @tower["t#{@entered[1]}"][0]
      	return false
      else
      	return true
      end
    end


end

class Move

end