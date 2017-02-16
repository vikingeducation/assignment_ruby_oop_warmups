require_relative "person.rb"
require_relative "computer.rb"

class Game
	# create game
	def initialize
		@player1 = Person.new
		@player2 = Person.new
		@comp = Computer.new	
		@num_players = nil
	end

	# Continue playing if it's a tie; display who won if two choices are different
	def play_vs_computer
		@player1.pick
		@comp.choose
		if tie?
			display_tie
			play_vs_computer
		else
			display_winner_vs_computer
		end
	end

	def play_vs_player
		@player1.pick
		@player2.pick
		if tie?
			display_tie
			play_vs_player
		else
			display_winner_vs_person
		end
	end

	# Two player mode?
	def two_players?
		puts "How many players? Input 1 or 2"
		@num_players = gets.chomp
		unless valid_input?
			two_players?
		end
		@num_players == "2"
	end

	def valid_input?
		@num_players == "1" || @num_players == "2"
	end

	def tie?
		@player1.choice == @comp.choice || @player1.choice == @player2.choice
	end

	def display_tie
		puts "Tie! Keep playing!"
	end

	# Determine winner of game
	def winner_vs_computer
		if @player1.choice == "r" && @comp.choice == "s"
			return @player1
		elsif @player1.choice == "p" && @comp.choice == "r"
			return @player1
		elsif @player1.choice == "s" && @comp.choice == "p"
			return @player1
		else
			return @comp
		end
	end

	def winner_vs_person
		if @player1.choice == "r" && @player2.choice == "s"
			return @player1
		elsif @player1.choice == "p" && @player2.choice == "r"
			return @player1
		elsif @player1.choice == "s" && @player2.choice == "p"
			return @player1
		else
			return @player2
		end
	end

	# Display winner of game
	def display_winner_vs_computer
		if winner_vs_computer == @player1
			puts "Player 1 won!"
		else
			puts "Computer won!"
		end
	end

	def display_winner_vs_person
		if winner_vs_person == @player1
			puts "Player 1 won!"
		else
			puts "Player 2 won!"
		end
	end
end
	
if Game.new.two_players?
	Game.new.play_vs_player
else
	Game.new.play_vs_computer
end















