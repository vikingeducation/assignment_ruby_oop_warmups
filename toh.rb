require 'pry'

class Toh
	attr_accessor
  def initialize(height)
  	@height = height.to_i
  	@towers = [[],[],[]]
  end

  def render
		@height.times do |n|
  		n += 1
  		@towers[0] << n
  	end
  	puts @towers.inspect
  end
  def get_tower_selection
  	puts "Enter where you'd like to move from and to\nin the format '1,3'"
  	puts "q: to quit."
  	gets.strip.split(",").map(&:to_i)
  end
  def coordinates
  	loop do
  	coordinates = get_tower_selection
  	puts coordinates.inspect
  	validate_coordinates_selection
  	
  end
  end

  def validate_coordinates_selection(coordinates)
    from = coordinates[0]
    to = coordinates[1]
  	if from <= 0 || towers[from].nil?
      puts "invalid move"
    elsif to <= 0 || towers[to].nil?
      puts "invalid move"
    elsif from == to
      puts "invalid move"
    elsif !towers[to].empty? && towers[from].last > towers[to].last
      puts "invalid move"
    else
      towers[to] << towers[from].pop
    end
  end
  	
 
end

  		
    
  

game = Toh.new(3)
game.get_tower_selection
game.coordinates
game.render
