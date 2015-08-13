class Auth
	def valid_player_number?(n)
		n > 0 && n < 3
	end

	def valid_hand?(n)
		n >= 0 && n < 3
	end
end