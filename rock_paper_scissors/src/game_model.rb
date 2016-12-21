require_relative 'game_validation.rb'
require_relative 'hand.rb'

class GameModel < Model
	attr_accessor :num_players, :player_one, :player_two

	def initialize
		super(:validation => GameValidation.new)
	end

	def clear
		@num_players = nil
		@player_one = nil
		@player_two = nil
	end

	def current_player
		player = :player_one if turn == '1'
		player = :player_two if turn == '2'
		player
	end

	def current_player=(value)
		player = nil
		if @validation.valid_hand?(value)
			player = @player_two = select_hand(value) if turn == '2'
			player = @player_one = select_hand(value) if turn == '1'
		end
		player
	end

	def num_players=(value)
		@num_players = value if @validation.valid_num_players?(value)
	end

	def player_one=(value)
		@player_one = select_hand(value) if @validation.valid_hand?(value)
	end

	def player_two=(value)
		@player_two = select_hand(value) if @validation.valid_hand?(value)
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

	def shoot_ready?
		@player_one && @player_two
	end

	private
		def select_hand(value)
			[Rock.new, Paper.new, Scissors.new][value.to_i - 1]
		end
end