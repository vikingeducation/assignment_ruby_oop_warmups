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
		height = Tower.new
		tower = height.tower
		show = Display.new
		show.create_display(tower)
    valid = Validate.new(tower)
    make_move = Move.new

    loop do  	
     to_move = valid.move_choice
     tower =  make_move.move_disk(to_move, tower)
     show(tower)
    end  
	end
end

class Tower
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
    valid_entry = false
   	valid_move = false
    until valid_move
      puts "Please enter your move in [from , to]"
      @entered = gets.chomp.split(",").map{|x| x.to_i}
      
      if  valid_entry = @entered.all?{|x| (1..3).include?(x)}
         valid_move = valid_move?
      end
      
    end
    return @entered
   end

    #def valid_entry?
      
      
   # end

    def valid_move?
    	
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

    def move_disk(move, tow)
      p tow["t#{move[1]}"]
      p tow["t#{move[0]}"][0] 

       tow["t#{move[1]}"] << tow["t#{move[0]}"][0]
       tow["t#{move[0]}"].shift
       return tow
    end


end