class RockPaperScissors
	
	def play_game
		start
		game_type
		if @type == 'c'
			player_input
			computer_input
			match(@player, @computer)
		else
			player1 = player_input
			player2 = player_input
			match(player1, player2)
		end
	end

	def start
		puts "Welcome to Rock, Paper, Scissors!"
		puts "Rock beats Scissors, Scissors beats Paper, and Paper beats Rock"
	end

	def game_type
		puts "Do you want to play against the computer(c) or another player(p)?"
		@type = gets.chomp
	end

	def player_input
		puts "What is your choice?"
		@player = gets.chomp
	end

	def computer_input
		@computer = ["rock", "paper", "scissors"].sample
		puts "Computer: #{@computer}"
	end

	def match(player, computer)
		if player == computer
			puts "It's a tie"
		elsif player == "rock"
			if computer == "scissors"
				puts "Rock beats Scissors!"
			else
				puts "Paper beats Rock!"
			end
		elsif player == "scissors"
			if computer == "rock"
				puts "Rock beats Scissors!"
			else
				puts "Scissors beats Paper!"
			end
		elsif player == "paper"
			if computer == "rock"
				puts "Paper beats Rock!"
			else
				puts "Scissors beats Paper!"
			end
		end			
	end
end