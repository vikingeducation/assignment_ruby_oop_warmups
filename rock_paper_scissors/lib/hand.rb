class Hand
	def ties?(hand)
		(self <=> hand) == 0
	end

	def beats?(hand)
		(self <=> hand) == 1
	end

	def <=>(other)
		self.compare(other) <=> other.compare(self)
	end

	def compare(hand)
	end
end

class Rock < Hand
	def compare(hand)
		case hand.class
		when Rock
			return 0
		when Paper
			return -1
		when Scissors
			return 1
		end
	end
end

class Paper < Hand
	def compare(hand)
		case hand.class
		when Rock
			return 1
		when Paper
			return 0
		when Scissors
			return -1
		end
	end
end

class Scissors < Hand
	def compare(hand)
		case hand.class
		when Rock
			return -1
		when Paper
			return 1
		when Scissors
			return 0
		end
	end
end