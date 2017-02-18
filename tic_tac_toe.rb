require 'pry'
class Game
	def start(name)
		#Start prompt
		puts "Welcome #{name}"
		puts "Select\n1: Rock \n2: Paper\n3: Scissors\n"
		#gets user input
		@player1_choice = gets.chomp.to_i
		#creates hash of game choices
		game_selection = {1 => "Rock", 2 => "Paper", 3 => "Scissors"}
		#iterates through hash 
		game_selection.each do |key, value|
			#checks hash and displays the item selected
			if @player1_choice == key
				puts "You selected #{value}"
			end
		end
	end

	def cpu_choice
		#gets random number between 1-3
		 puts @cpu_choice = rand(3) + 1
	end

	def win
		if @player1_choice == @cpu_choice
		  puts "Draw"
		end
	end
end


class Player
	def initialize(name)
		@name = name
	end
end

player1 = Player.new("Chad")

game = Game.new
game.start(player1)
game.cpu_choice
game.win