# |--\ 
# |   |
# |___|

#  /-/\
# | , '|
#  \_/-/

#  \/
#  /\
# 0  0

class View
	attr_accessor :notice, :template

	def initialize
		@notice = ''
		@template = nil
	end

	def banner
		"Rock Paper Scissors\n----\nWelcome to Rock Paper Scissors, type 'q', 'quit', or 'exit' to quit\n\n"
	end

	def select_players
		"Please select 1 or 2 players"
	end

	def play
		"Playing"
	end

	def game_over
		"Game Over!"
	end

	def render
		system('clear')
		puts banner
		puts send(@template) if @template
		puts @notice if ! @notice.empty?
		print "\n> "
	end
end