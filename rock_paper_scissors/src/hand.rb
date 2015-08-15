class Hand
	def compare(hand)
	end

	def >(other)
		beats?(other)
	end

	def <(other)
		! beats?(other)
	end

	def >=(other)
		beats?(other) || ties?(other)
	end

	def <=(other)
		! beats?(other) || ties?(other)
	end

	def ==(other)
		ties?(other)
	end

	def <=>(other)
		self.compare(other) <=> other.compare(self)
	end

	def ties?(hand)
		(self <=> hand) == 0
	end

	def beats?(hand)
		(self <=> hand) == 1
	end
end

class Rock < Hand
	def compare(hand)
		case hand
		when Rock
			return 0
		when Paper
			return -1
		when Scissors
			return 1
		end
	end

	def to_s
		'rock'
	end
end

class Paper < Hand
	def compare(hand)
		case hand
		when Rock
			return 1
		when Paper
			return 0
		when Scissors
			return -1
		end
	end

	def to_s
		'paper'
	end
end

class Scissors < Hand
	def compare(hand)
		case hand
		when Rock
			return -1
		when Paper
			return 1
		when Scissors
			return 0
		end
	end

	def to_s
		'scissors'
	end
end