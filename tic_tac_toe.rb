require 'pry'
class Game
	#hash of game selection
	@@game_selection = {1 => "Rock", 2 => "Paper", 3 => "Scissors"}
	def start(name)
		#Start prompt
		puts "Welcome #{name}"
		puts "Select\n1: Rock \n2: Paper\n3: Scissors\n"
		#gets user input
		@player1_choice = gets.chomp.to_i
		#iterates through hash 
		@@game_selection.each do |key, value|
			#checks hash and displays the item selected
			if @player1_choice == key
				puts "You selected: #{value}"
			end
		end
	end

	def cpu_choice
		#gets random number between 1-3
		binding.pry
		 @cpu_choice = rand(3) + 1
		 #iterates through hash
		 @@game_selection.each do |key, value|
		 	#checks computers selection and compares it to key in hash
		 	if @cpu_choice == key
		 		puts "Computer selected: #{value}"
		 	end
		 end
	end

	def win
		  #puts losing combinations
	      puts "You Lose!" if @player1_choice == 1 && @cpu_choice == 2 || @player1_choice == 2 && @cpu_choice == 3
		  #puts wining combinations
		  puts "You Win!" if @player1_choice == 1 && @cpu_choice == 3 || @player1_choice == 3 && @cpu_choice == 2
		  #puts draw if computer and plater pick the same 
		  puts "Draw!" if @player1_choice == @cpu_choice
	end
end


class Player
	attr_accessor :name
	
end

player1 = Player.new
player1.name = "Chad"

game = Game.new
game.start(player1.name)
game.cpu_choice
game.win