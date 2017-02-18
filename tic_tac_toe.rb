require 'pry'
class Game
	def start(name)
		#Start prompt
		puts "Welcome #{name}"
		puts "Select\n1: Rock \n2: Paper\n3: Scissors\n"
		#gets user input
		player1_choice = gets.chomp.to_i
		binding.pry
	end

	def cpu_choice
		cpu_result = rand(3) + 1
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