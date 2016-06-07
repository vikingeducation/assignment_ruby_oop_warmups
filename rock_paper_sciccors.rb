# ./rock_paper_scissors.rb

#PROGRAM ROCKPAPERSCISSORS
require 'pry'
#Class will be the whole game RPS
class RockPaperScissors
	#instance methods will be CPU and PLAYER
	#attr_accessor :player_move

	def initialize
		@cpu_move = ['rock', 'paper', 'scissors'].sample
	#def CPU
		#the CPU will generate Rock Paper or Scissors stored into a variable - this can be intialized
	end
	#end CPU


	# set up a method to check the player and CPU moves
	def outcome( player_move )
		if @cpu_move == "rock"

			if player_move == "rock"
				puts "Tie! Both players had #{@cpu_move}"

			elsif player_move == "paper"
				puts "Player wins! #{player_move} beats #{@cpu_move}"

			elsif player_move == "scissors"
				puts "CPU wins! #{@cpu_move} beats #{player_move}"
			end

		elsif @cpu_move == "paper"

			if player_move == "rock"
				puts "CPU wins! #{@cpu_move} beats #{player_move}"

			elsif player_move == "paper"
				puts "Tie! Both players had #{@cpu_move}"

			elsif player_move == "scissors"
				puts "Player wins! #{player_move} beats #{@cpu_move}"
			end

		elsif @cpu_move == "scissors"

			if player_move == "rock"
				puts "Player wins! #{player_move} beats #{@cpu_move}"

			elsif player_move == "paper"
				puts "CPU wins! #{@cpu_move} beats #{player_move}"

			elsif player_move == "scissors"
				puts "Tie! Both players had #{@cpu_move}"
			end

		end

  end #/outcome

end
#END /ROCKPAPERSCISSORS



puts "Please enter rock, paper or scissors"
player_move = gets.strip.downcase

new_game = RockPaperScissors.new

new_game.outcome(player_move)

