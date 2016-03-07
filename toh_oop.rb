

class Game
	attr_reader :height

	def initialize height = 3
		@player = Player.new
		@height = height
		@board = Board.new height
	end


	# Play Method
	def start_game
		instructions

		@board.render_board


		loop do

			puts "\nWhat is your move? example : 1 2  /  \"quit\" to exit"

			player_move = @player.user_input

			move_from, move_to = player_move[0], player_move[1]

			if @board.check_move( move_from, move_to )

				@board.move_disk( move_from, move_to )

				victory?
					
				@board.render_board

			else
				puts "\n You cannot do this move\n"
				next
			end

		end
	end


	def instructions
		puts "\nThis is the tower of Hanoi\n\nHope you're ready !\n"
	end


	def victory?
		if @board.towers[2].length == @height || @board.towers[3].length == @height
			puts "\n You Win ! Congratulation !\n"
			@board.render_board
			exit
		end
	end
end



class Board

	attr_accessor :towers


	def initialize height
		@towers = { 1 => [], 2 => [], 3 => [] }
		create_board height
	end

	# Initialize Board
	def create_board height
		(height).downto(1) { |disk| @towers[1] << disk }
	end


	def render_board
		puts @towers
	end


	def check_move move_from, move_to
		return false unless move_from.between?(1,3) && move_to.between?(1,3)           # You Select Two Towers
		return false if @towers[move_from].empty?									   # There is a disk to move?
		if @towers[move_to].empty? || @towers[move_to].last > @towers[move_from].last  # The disk can be stack on new tower?
			return true
		end
	end


	def move_disk move_from, move_to

		@towers[move_to].push @towers[move_from].pop

		puts "you moved from #{move_from} to #{move_to}"
	end

end



class Player

	def user_input

		loop do
			coordinates = gets.chomp

			if  coordinates == "quit"
				exit
			end

			coordinates = coordinates.split(" ").map! { |move| move.to_i }  # Format input

			if coordinates.size == 2
				move_from, move_to = coordinates[0], coordinates[1]         # Forward input if correct format
				return move_from, move_to
			else
				puts "Try to enter something like ---  1 3  ---"
			end
		end
	end
end

game = Game.new(3)

game.start_game