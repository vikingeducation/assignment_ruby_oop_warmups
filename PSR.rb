# Presentation

# Choose between 3 choices

# The Computer / otherPlayer Choose between 3 choices

# Compare Win / lose / Tie

# Play again? 

class Psr

	def initialize
		play
	end


	def play
		type_of_game

		presentation

		player_input = @player.take_input
		player2_input = @player2.take_input
		compare player_input, player2_input

		play_again?
	end


	def type_of_game
		puts "\n Do you want to play 1 player ( 1P ) or 2 players ( 2P ) ?"

		loop do
			input = gets.chomp.upcase
			if input == "1P"
				@player = Player.new("Player1")
				@player2 = Computer.new("Computer")
				break
			elsif input == "2P"
				@player = Player.new("Player1")
				@player2 = Player.new("Player2")
				break
			else
				puts "???"
			end
		end
	end


	def presentation
		puts "\n Welcome to the Paper Scissors Rock Office\n"
		puts "\n You can choose between one of them ( P - S - R ) or - Q - to quit\n"
		puts "\n What would it be? "
	end


	def compare player, player2
		if player == player2
			puts "\n It's a Tie !"

		elsif ( player == "P" && player2 == "R" )|| ( player == "S" && player2 == "P" ) || ( player == "R" && player2 == "S" )
			puts "\n #{@player.name} Win ! #{@player.name} played #{player} and #{@player2.name} played #{player2} !\n"
		else
			puts "\n #{@player2.name} Win ! #{@player2.name}  played #{player} and #{@player.name} played #{player2} !\n"
		end
	end


	def play_again?
		puts "\n Play Again?  Y  -  N  ? "
		play if gets.chomp.upcase == "Y"
	end
end


class Player
	attr_reader :input_player, :name

	def initialize name
		@name = name
	end

	def take_input
		loop do
			@input_player = gets.chomp.upcase
			break if valid_input? @input_player
			puts "What do you mean? P / R / S ?"
		end
		@input_player
	end


	def valid_input? input
		if ("PSRQ").include? input
			return true
		end
	end
end


class Computer

	attr_reader :input_computer, :name

	def initialize name
		@name = name
	end

	def take_input
		choices = ["P", "S", "R"]
		@input_computer = choices[rand(0...choices.length)]
	end
end