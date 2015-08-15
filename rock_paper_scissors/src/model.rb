require_relative 'hand.rb'

class Model
	attr_accessor :num_players, :player_one, :player_two

	def initialize
		@auth = Auth.new
		clear
	end

	def clear
		@num_players = 0
		@player_one = nil
		@player_two = nil
	end

	def num_players=(value)
		if @auth.valid_number_of_players?(value)
			@num_players = value
		else
			raise @auth.error
		end
	end

	def player_one=(value)
		if @auth.valid_hand?(value)
			@player_one = select_hand(value)
		else
			raise @auth.error
		end
	end

	def player_two=(value)
		if @auth.valid_hand?(value)
			@player_two = select_hand(value)
		else
			raise @auth.error
		end
	end

	def turn
		return '2' if two_player? && @player_one
		return '1'
	end

	def shoot
		if @player_one.beats?(@player_two)
			winner = '1'
			loser = '2'
			winning_hand = @player_one.to_s
			losing_hand = @player_two.to_s
		else
			winner = '2'
			loser = '1'
			winning_hand = @player_two.to_s
			losing_hand = @player_one.to_s
		end
		{
			:winner => winner,
			:loser => loser,
			:winning_hand => winning_hand,
			:losing_hand => losing_hand
		}
	end

	def tie?
		@player_one.ties?(@player_two)
	end

	def two_player?
		@num_players == '2'
	end

	private
		def select_hand(value)
			[Rock.new, Paper.new, Scissors.new][value.to_i - 1]
		end
end
