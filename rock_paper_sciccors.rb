# ./rock_paper_scissors.rb

require 'pry'
class RockPaperScissors


	def initialize( player_move )

		@cpu_move = ['rock', 'paper', 'scissors'].sample



	end


	def tie?
		if @cpu_move == @player_move

			puts "Tie! Both players had #{@cpu_move}"

		end

	end



	def player_wins

		puts "Player wins! #{@player_move} beats #{@cpu_move}"

	end



	def cpu_wins

		puts "CPU wins! #{@cpu_move} beats #{@player_move}"

	end



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

