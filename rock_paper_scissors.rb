require_relative 'player'

class RockPaperScissors
	attr_accessor :player1 , :player2 , :number_of_rounds_remaining

	def initialize
		puts "How many rounds do you want to play?"
		input_given = gets.chomp.to_i
		while input_given < 1
			puts "Please enter a valid integer greater than 0"
			input_given = gets.chomp.to_i
		end
		@number_of_rounds_remaining = input_given
	end

	def show_score
		puts "#{player1.name} : #{player1.score} #{player2.name} : #{player2.score} Rounds Remaining : #{@number_of_rounds_remaining}"
	end

	def compare_choice
		case player1.cur_choice
			when "r" 
				(player2.cur_choice == "s") ? 1 : ((player2.cur_choice == "p") ? 2 : 0)
			when "p" 
				(player2.cur_choice == "s") ? 2 : ((player2.cur_choice == "r") ? 1 : 0)
			when "s" 
				(player2.cur_choice == "r") ? 2 : ((player2.cur_choice == "p") ? 1 : 0)
			else
				3
				
		end
	end

	def compare_scores
		result = player1.score <=> player2.score
		if result == 1
			puts "#{player1.name} wins game!"
		elsif result == -1
			puts "#{player2.name} wins game!"
		else
			puts "Game is a draw!"
		end
	end

	def show_result(result)
		puts "#{player1.name} draws #{player1.cur_choice} while #{player2.name} draws #{player2.cur_choice}"
		if result == 1
			puts "#{player1.name} wins round!"
			player1.score += 1
			@number_of_rounds_remaining -= 1
		elsif result == 2
			puts "#{player2.name} wins round!"
			player2.score += 1
			@number_of_rounds_remaining -= 1
		elsif result == 3
			puts "Bad Choices!"
		else
			puts "Round is a draw!"
			@number_of_rounds_remaining -= 1
		end
	end

	def create_players
		puts "Please enter your name:"
		name = gets.chomp
		@player1 = Player.new(name, 1)
		puts "Do you want to play against computer? (y/n)"
		yes_no = gets.chomp
		while ((yes_no != "y") && (yes_no != "n"))
			puts "Please enter either 'y' or 'n'"
			yes_no = gets.chomp
		end
		if yes_no == "y"
			@player2 = Player.new("Computer", 0)
		else
			puts "Please enter second player's name:"
			name = gets.chomp
			@player2 = Player.new(name, 1)
		end
	end

	def play
		create_players
		while(@number_of_rounds_remaining > 0)
			puts "Please enter your choice"
			player1_choice = gets.chomp
			player1.cur_choice = player1_choice
			if player2.type == 1
				puts "Please enter player 2 choice"
				player2_choice = gets.chomp
				player2.cur_choice = player2_choice
			else
				player2_choice = player2.make_choice
			end
			result = compare_choice
			show_result result
			show_score
		end
		compare_scores
	end
end

game = RockPaperScissors.new
game.play