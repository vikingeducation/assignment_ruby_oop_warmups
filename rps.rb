class Player
	@@move_list = ["Rock", "Paper", "Scissors"]

	def initialize
		@move = nil
	end

	attr_accessor :move
#process player input (take text and make it the selection)
#define all possible moves


	def valid_input?
		@move = gets.chomp.upcase
		if @move == "R" || @move == "ROCK"
			return true
		elsif @move == "P" || @move == "PAPER"
			return true	
		elsif @move == "S" || @move == "SCISSORS"
			return true
		else
			print "Not a valid input\n"
			false
		end
	end

end

class Game

	def initialize
		@player1 = Player.new
		@player2 = Player.new
		@turn = 1
	end
#instruction
#display game
#game loop (while)
#win conditions
	def print_welcome
		print "Welcome to RPSE!!!! Rock Paper Scissors Extreme!!!\n"
	end

	def print_instructions
		print "Type your selection (ie., 'rock' or 'r'). Options include: (R)ock, (P)aper, (S)cissors\n"
	end

end

class Computer
#calculate computer move

end

class

end