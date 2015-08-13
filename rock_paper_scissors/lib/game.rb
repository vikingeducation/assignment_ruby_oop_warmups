class Game
	# REFACTOR

	attr_reader :input
	attr_accessor :player_one, :player_two, :num_players, :turn, :view, :auth, :controller

	def initialize
		reset
		listen
	end

	def reset
		@auth = Auth.new
		@view = View.new
		@state = State.new
		@controller = Controller.new
		@input = nil
		@player_one = nil
		@player_two = nil
		@num_players = nil
		@turn = 0
	end

	def listen
		begin
			@state.update(self)
			@input = prompt
		end while ! @state.quitting?
	end

	def prompt
		@view.render
		gets.chomp
	end

	def to_hand(input)
		[Rock.new, Paper.new, Scissors.new][input]
	end
end