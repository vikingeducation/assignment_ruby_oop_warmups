# ./rock_paper_scissors.rb

require 'pry'
class RockPaperScissors


	def initialize( player_one, player_two )

		@player_one = player_one

		@player_two = player_two


	end


	def tie?
		if @player_two == @player_one
			puts "Tie! Both players had #{@player_two}"
		end
	end

	def player_one_wins

		puts "Player 1 wins! #{@player_one} beats #{@player_two}"

	end

	def player_two_wins

		puts "Player 2 wins! #{@player_two} beats #{@player_one}"

	end

	def outcome

		unless tie?



			if @player_two == "rock"

				if @player_one == "paper"

					player_one_wins

				elsif @player_one == "scissors"

					player_two_wins

				end




			elsif @player_two == "paper"

				if @player_one == "rock"

					player_two_wins

				elsif @player_one == "scissors"

					player_one_wins

				end



			elsif @player_two == "scissors"

				if @player_one == "rock"

					player_one_wins

				elsif @player_one == "paper"

					player_two_wins

				end

			end



		end #/.unless
	end #/.outcome

end
#END /.ROCKPAPERSCISSORS



puts "Player 1: Please enter rock, paper or scissors"
player_one = gets.strip.downcase
puts "Player 2: Please enter rock, paper or scissors"
player_two = gets.strip.downcase

new_game = RockPaperScissors.new( player_one, player_two )

new_game.outcome

