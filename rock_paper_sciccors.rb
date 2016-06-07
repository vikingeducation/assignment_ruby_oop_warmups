# ./rock_paper_scissors.rb

#PROGRAM ROCKPAPERSCISSORS
require 'pry'
#Class will be the whole game RPS
class RockPaperScissors


	def initialize( player_move )

		#the CPU will generate Rock Paper or Scissors stored into a variable - this can be intialized
		@cpu_move = ['rock', 'paper', 'scissors'].sample

		#player move stored in instance var
		@player_move = player_move


	end


	# checking for a tie
	def tie?
		if @cpu_move == @player_move
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
	def outcome

		unless tie?



			if @cpu_move == "rock"

				if @player_move == "paper"

					player_wins

				elsif @player_move == "scissors"

					cpu_wins

				end




			elsif @cpu_move == "paper"

				if @player_move == "rock"

					cpu_wins

				elsif @player_move == "scissors"

					player_wins

				end



			elsif @cpu_move == "scissors"

				if @player_move == "rock"

					player_wins

				elsif @player_move == "paper"

					cpu_wins

				end

			end



		end #/.unless
	end #/.outcome

end
#END /.ROCKPAPERSCISSORS



puts "Please enter rock, paper or scissors"
player_move = gets.strip.downcase

new_game = RockPaperScissors.new( player_move )

new_game.outcome

