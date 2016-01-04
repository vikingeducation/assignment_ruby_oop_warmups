class Player
	@@move_list = ["Rock", "Paper", "Scissors"]

	def initialize
		@move = nil
	end

	attr_accessor :move
	#process player input (take text and make it the selection)
	#define all possible moves

	#checks "move" argument if it's valid move
	def valid_input?(move)
		if move == "R" || move == "ROCK"
			return true
		elsif move == "P" || move == "PAPER"
			return true
		elsif move == "S" || move == "SCISSORS"
			return true
		else
			false
		end
	end

	#
	def get_move
		user_input = gets.chomp.upcase
		if valid_input?(user_input)
			@move = user_input
		else
			print "Not a valid input!\n"
			get_move
		end
	end
end

class Game

	def initialize
		@player1 = Player.new
		@player2 = Player.new
		@turn = true
		@win = false
	end
	#instruction
	#display game
	#game loop (while)
	#win conditions

	#prints welcome
	def print_welcome
		print "Welcome to RPSE!!!! Rock Paper Scissors Extreme!!!\n"
	end

	#print instructions
	def print_instructions
		print "Type your selection (ie., 'rock' or 'r'). Options include: (R)ock, (P)aper, (S)cissors\n"
	end

	#runs game logic
	def game_loop
		print_welcome
		print_instructions

		until @win

			if @turn
				puts "Player 1's Turn: "
				@player1.get_move

				@turn = false
			else
				puts "Player 2's Turn: "
				@player2.get_move
				@turn = true
			end

			if @player1.move && @player2.move
				compare_moves(@player1.move, @player2.move)
			end

		end

	end

	#compares moves between players
	def compare_moves(p1_move, p2_move)
		if p1_move[0] == p2_move[0]
			puts "It's a tie, try again..."
			@player1.move = nil
			@player2.move = nil
		elsif p1_move[0] == "R"
			if p2_move[0] == "S"
				puts "Player 1 wins!"
				@win = true
			else
				puts "Player 2 wins!"
				@win = true
			end

		elsif p1_move[0] == "P"
			if p2_move[0] == "S"
				puts "Player 2 wins!"
				@win = true
			else
				puts "Player 1 wins!"
				@win = true
			end
		else p1_move[0] == "S"
			if p2_move[0] == "R"
				puts "Player 2 wins!"
				@win = true
			else
				puts "Player 1 wins!"
				@win = true
			end
		end
	end
end

class Computer
#calculate computer move

end

g = Game.new

g.game_loop
