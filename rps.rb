class Player
	@@move_list = ["Rock", "Paper", "Scissors"]

	def initialize(name)
		@move = nil
		@name = name
	end

	attr_accessor :move, :name
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
		@player1 = Player.new("Player 1")
		@player2 = Player.new("Player 2")
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

	#determine human player vs computer
	def options
		puts "To choose your opponent, type 'human' or 'computer': "
		input = gets.chomp.upcase

		if input == 'COMPUTER'
			@player2 = Computer.new("Computer")
		elsif input == "HUMAN"
		else
			puts "Input is invalid."
			options
		end
	end

	#runs game logic
	def game_loop
		print_welcome
		print_instructions
		options

		until @win

			if @turn
				puts "Player 1's Turn: "
				@player1.get_move

				@turn = false
			else
				puts "#{@player2.name}'s Turn: "
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
				puts "#{@player2.name} wins!"
				@win = true
			end

		elsif p1_move[0] == "P"
			if p2_move[0] == "S"
				puts "#{@player2.name} wins!"
				@win = true
			else
				puts "Player 1 wins!"
				@win = true
			end
		else p1_move[0] == "S"
			if p2_move[0] == "R"
				puts "#{@player2.name} wins!"
				@win = true
			else
				puts "Player 1 wins!"
				@win = true
			end
		end
	end
end

class Computer < Player
#calculate computer move
#generate random number from 1-3
#use random number as index to generate random move
	
	def get_move
		@move = @@move_list[rand(3)]
		puts "Computer selects #{@move}"
	end
end

g = Game.new

g.game_loop