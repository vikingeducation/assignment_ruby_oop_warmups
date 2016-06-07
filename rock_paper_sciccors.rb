# ./rock_paper_scissors.rb

#PROGRAM ROCKPAPERSCISSORS
require 'pry'
#Class will be the whole game RPS
class RockPaperScissors
	#instance methods will be CPU and PLAYER
	#attr_accessor :player_move

	def initialize( player_move )
		@cpu_move = ['rock', 'paper', 'scissors'].sample
		@player_move = player_move
	#def CPU
		#the CPU will generate Rock Paper or Scissors stored into a variable - this can be intialized
	end
	#end CPU

	# checking for a tie
	def tie? ( player_move )
		if @cpu_move == player_move
			puts "Tie! Both players had #{@cpu_move}"
		end
	end

	#output upon player victory
	def player_wins

		puts "Player wins! #{@player_move} beats #{@cpu_move}"

	end

	#output upon CPU victory
	def cpu_wins

		puts "CPU wins! #{@cpu_move} beats #{@player_move}"

	end

	# set up a method to check the player and CPU moves
	def outcome( player_move )
		if @cpu_move == "rock"
			if player_move == "paper"
				player_wins
			elsif player_move == "scissors"
				cpu_wins
			end

		elsif @cpu_move == "paper"

			if player_move == "rock"

				cpu_wins

			elsif player_move == "scissors"

				player_wins

			end

		elsif @cpu_move == "scissors"

			if player_move == "rock"

				player_wins

			elsif player_move == "paper"

				cpu_wins

			end

		end

  end #/outcome

end
#END /ROCKPAPERSCISSORS



puts "Please enter rock, paper or scissors"
player_move = gets.strip.downcase

new_game = RockPaperScissors.new( player_move )

new_game.tie?(player_move)
new_game.outcome(player_move)

