# class called RPS
# method: get method takes user input turned into command
# method: computer randomly select: rock/paper/scissors
# instance variable: computer decision
# instance variable: player1 decision
# method: turn gets everything going
# method: new/initialize
# method: compare method for winner

class RockPaperScissors

	OPTIONS = {
		'rock' => 'paper',
    'paper' => 'scissors',
    'scissors' => 'rock'
	}

  # values beat keys, check computer decision against
  # if OPTIONS[@human_decision] == @computer_decision ; humans lost
  # if @human == @comp ; tie message
  # otherwise ; win

	def initialize(players)
		@players = players
	end

	def play
		if @players == 1
			puts "Choose your weapon:"
			@user_decision = gets.chomp.downcase
			@computer_decision = ["rock", "paper", "scissors"][rand(3)]
      puts "Computer chooses #{@computer_decision}."
			compare(@user_decision, @computer_decision)
			puts "Play again?"
			if gets.chomp.downcase == "y"
				play
			elsif gets.chomp.downcase == "n"
				exit
			end
		elsif @players == 2
			puts "Player 1, choose your weapon:"
			@user1_decision = gets.chomp.downcase
			puts "Player 2, choose your weapon:"
			@user2_decision = gets.chomp.downcase
			compare(@user1_decision, @user2_decision)
			puts "Play again?"
			if gets.chomp.downcase == "y"
				play
			elsif gets.chomp.downcase == "n"
				exit
			end
		end	
	end

	def compare(player1, player2)
    if @players == 1
      if player1 == player2
      puts "It was a tie!"
  		elsif OPTIONS[player1] == player2
        puts "You lose!"
      elsif OPTIONS[player1] != player2
        puts "You win!"
  		end
    elsif @players == 2
      if player1 == player2
      puts "It was a tie!"
      elsif OPTIONS[player1] == player2
        puts "Player 2 wins!"
      elsif OPTIONS[player1] != player2
        puts "Player 1 wins!"
      end
    end
	end

end