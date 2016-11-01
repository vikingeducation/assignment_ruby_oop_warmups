class RockPaperScissors 
	BEATS = { 'r' => 's', 'p' => 'r', 's' => 'p' }
	attr_accessor :p1, :p2

	def initialize(two_player=false)
		@p1 = Player.new("Player 1", true)
		if two_player == false
			@p2 = Player.new("Computer", false)
		elsif two_player
			@p2 = Player.new("Player2", false)
		end
		
	end

	def self.rand_weapon
		rps = ['r', 'p', 's']
		rps.shuffle[0]
	end

	def run
		puts "#{@p1.name}: #{@p1.score} - #{@p2.name}: #{@p2.score}"
		round = Round.new(p1, p2, self)
		round.run		
	end

	def quit
		puts "Goodbye!"
	end

end

class Round
	attr_accessor :winner

	def initialize(p1, p2, game)
		@p1 = p1
		@p2 = p2
		@game = game
		@winner = nil
	end

	def run
		get_weapon(@p1)
		get_weapon(@p2)
		@winner = decide_winner(@p1, @p2)
		end_round
	end

	def get_weapon(player)
		if player.human?
			puts "#{player.name}, Choose your weapon:"
			puts "Rock (R)"
			puts "Paper (P)"
			puts "Scissors (S)"
			loop do 
				input = gets.chomp.downcase
				if valid_weapon?(input)
					player.weapon = input
					break
				else
					puts "Please enter (R/P/S)"
				end
			end
		else
			player.weapon = RockPaperScissors.rand_weapon
		end
	end

	def decide_winner(p1, p2)
		beats = RockPaperScissors::BEATS
		
		if beats[p1.weapon] == p2.weapon
			p1
		elsif beats[p2.weapon] == p1.weapon
			p2
		else
			:tie
		end
	end

	def end_round
		unless @winner == :tie
			puts "#{@winner.name} wins!"
			@winner.increase_score
		else
			puts "It's a tie"
		end
		puts "Play again?(y/n)"
		loop do 	
			input = gets.chomp.downcase
			if valid_yes_or_no?(input)
				if input == 'y'
					@game.run
				elsif input == 'n'
					@game.quit
					break
				end
			else
				puts "Please enter (Y/N)"
			end
		end
	end

	def valid_weapon?(weapon)
		['r','p','s'].include?(weapon)
	end

	def valid_yes_or_no?(input)
		['y','n'].include?(input)
	end
end

class Player
	attr_accessor :weapon, :name, :score, :human

	def initialize(name, human)
		@name = name
		@human = human
		@weapon = nil
		@score = 0
	end

	def human?
		human
	end

	def increase_score
		@score += 1
	end
end

game = RockPaperScissors.new
game.run
