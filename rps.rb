class Game

	# constants
	CHOICES = { 'p' => 'Paper', 'r' => 'Rock', 's' => 'Scissors' }
	
	# attribute macros
	attr_reader :player_one_choice, :player_two_choice, :game_mode
	
	#class methods

	# initialization
	def initialize()
		puts "Welcome to Rock, Paper, Scissors Game."
		game_mode = get_number_of_players()
		play(game_mode)
	end	

	# public instance methods	
	
	def get_number_of_players()
		loop do
			puts "Press 1 to play against the computer, or 2 for a two player game"
			selection = gets.chomp.to_i
			if selection == 2
				puts "You have selected two player mode"
				return selection
			elsif selection == 1
				puts "You have selected one player mode"
				return selection
			else
				puts "Please enter a valid mode, either 1 or 2"
			end
		end
	end

	def play(game_mode)

		loop do	

			player_one_choice = get_choice()

			if game_mode == 1 
				player_two_choice = CHOICES.keys.sample	
				puts "The computer has choosen #{player_two_choice}" 
			else
				player_two_choice = get_choice(2)
			end
			
			status = get_status(player_one_choice, player_two_choice)

			if status == 1 
				puts "Player 1 wins!"
				display_result(player_one_choice)
			elsif status == 2 
				if game_mode == 1 
					puts "The computer wins!"
				else
					puts "Player 2 wins!"
				end

				display_result(player_two_choice)
			else
				puts "It's a tie!"
			end
			
			puts "Play again? (y/n)"

			break if gets.chomp.downcase != 'y'
		end

	end

	def get_choice(player = 1)
		begin
			puts "Player #{player} pick an option: (r/p/s)"
			player_choice = gets.chomp.downcase
			puts "Player #{player} has choosen #{player_choice}"
			puts CHOICES.keys.include?(player_choice)
		end until CHOICES.keys.include?(player_choice)
		
		return player_choice
	end
	
	def get_status(player_one_choice, player_two_choice)
		if player_one_choice == player_two_choice
			status = 3
		elsif (player_one_choice == 'p' && player_two_choice == 'r') ||
			(player_one_choice == 'r' && player_two_choice == 's') ||
			(player_one_choice == 's' && player_two_choice == 'p')
			status = 1
		else
			status = 2
		end
	end

	def display_result(player_choice)
		
		case player_choice
		when 'p'
			puts "Paper wraps Rock!"
		when 'r'
			puts "Rock smashes Scissors!"
		when 's'
			puts "Scissors cuts Paper!"
		end
		

	end
end
rps = Game.new
rps.play
