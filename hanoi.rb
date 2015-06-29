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
    #until valid_entry && valid_move
      puts "Please enter your move in [from , to]"
      @entered = gets.chomp.split(",").map{|x| x.to_i}
      
       valid_move
    #end
   end

    def valid_entry
      @entered.all?{|x| (1..3).include?(x)}
    end

  #
    def valid_move
    
      puts @tower["t#{@entered[0]}"]
    end 


end

class Move

end