class Auth
	attr_reader :error

	def valid_number_of_players?(n)
		if ! ['1', '2'].include?(n)
			@error = "Invalid number of players: #{n.to_i.to_s}"
			return false
		end
		return true
	end

	def valid_hand?(n)
		if ! ['1', '2', '3'].include?(n)
			@error = "Invalid hand: #{n.to_i.to_s}"
			return false
		end
		return true
	end
end