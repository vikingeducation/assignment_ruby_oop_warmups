
require_relative 'platform.rb'
require_relative 'disk.rb'

class Game

	def initialize
		@win = false
		@platform
		@number_of_moves = 0
	end

	def setup
		@platform = Platform.new
		@platform.get_number_disks
		@platform.validate_number_disks
		@platform.add_disks
		@platform.render
	end

	def welcome
		puts "Welcome to the Tower of Hanoi game"
	end

	def instructions
		puts "To move a disk within the standard rules"
    puts "enter the pegs you'd like to move from and to"
    puts "in the format \"x, y\" e.g. peg 1 to peg 3 would be 1, 3."
	end

	def check_victory
		@platform.pegs[2].length == @platform.disks
	end

	def print_victory
		puts "Congratulations, you solved the game in #{@number_of_moves} moves!"
	end

	def play
		welcome
		instructions
		setup
		until @win
			@platform.make_move
			@number_of_moves += 1
			@platform.render
			#binding.pry
			print_victory if @check_victory
		end
	end

end

game = Game.new

game.play