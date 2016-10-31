class RockPaperScissors 

	def initialize(two_player=false)
		@two_player = two_player
		@p1_score = 0
		@p2_score = 0
		@beats = { 'r' => 's', 'p' => 'r', 's' => 'p' }
	end

	def run
		puts "Score: #{@p1_score} - #{@p2_score}"
		puts "Choose your weapon:"
		puts "Rock (R)"
		puts "Paper (P)"
		puts "Scissors (S)"
		p1_choice = gets.chomp.downcase
		if (@two_player)
			p2_choice = gets.chomp.downcase
		else
			p2_choice = rand_weapon
		end
		winner = decide_winner(p1_choice, p2_choice)
		end_round(winner)
	end

	def rand_weapon
		rps = ['r', 'p', 's']
		rps.shuffle[0]
	end

	def decide_winner(p1_choice, p2_choice)
		if @beats[p1_choice] == p2_choice
			"Player 1"
		elsif @beats[p2_choice] == p1_choice
			"Player 2"
		else
			"Tie"
		end
	end

	def end_round(winner)
		unless winner == "Tie"
			puts "Winner is #{winner}"
		else
			puts "Game is a tie!"
		end
		increment_score(winner)
		puts "Play again? (Y/N)"
		input = gets.chomp.downcase
		if input == 'y'
			run
		elsif input == 'n'
			quit
		end
	end

	def increment_score(winner)
		if winner == "Player 1"
			@p1_score += 1
		elsif winner == "Player 2"
			@p2_score += 1
		end
	end

	def quit
		puts "Goodbye!"
	end

end

game = RockPaperScissors.new
