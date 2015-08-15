class Auth
	def valid_number_of_players?(n)
		['1', '2'].include?(n)
	end

	def valid_hand?(n)
		['1', '2', '3'].include?(n)
	end
end