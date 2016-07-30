class Game
	def initialize
		@player = Player.new("Farruh")
		@ai = Oponent.new("AI")
		@friend = Oponent.new("Drug")
	end

	def play
		welcome

		while true
			user_input = gets.chomp
			if user_input == "q"
				exit
			else
				arr = []
				arr << user_input << @ai.rand_output
				win_or_lose?(arr)
				turn
			end
		end
	end

	def win_or_lose?(input)
		case input
		when ["p", "r"], ["r", "s"], ["s", "p"]
			puts "#{@player.name}, you won!"
		when ["r", "p"], ["s", "r"], ["p", "s"]
			puts "#{@player.name}, you lost this game :("
		when ["p", "p"], ["s", "s"], ["r", "r"]
			puts "You and #{@ai.name} chose the same thing."
			puts "Game is draw.."
		else
			puts "Invlalid entry"
		end
	end

	def ai_or_human?
		puts "Type number of players: 1 or 2"
		players = gets.chomp
		if players == "1"
			true
		elsif players == "2"
			false
		end
	end

	def welcome
		puts "Welcome to RPS game!"
		puts "Game rules: enter 'r' for rock,'p' for paper,'s' for scissors, 'q' to quit."
	end

	def turn
		puts "Your input"
	end

end

class Player
	attr_reader :name
	def initialize(name)
		@name = name
	end
end

class Oponent
	attr_reader :name
	def initialize(name)
		@name = name
	end

	def rand_output
		['r', 'p', 's'].sample
	end
end
