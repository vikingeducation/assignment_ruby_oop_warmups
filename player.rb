class Player
	@@item_list = {0 => 'rock',1 =>'paper',2 =>'scissors',3 => 'quit'}

	def initialize()
		@total_wins = 0
		@total_losses = 0
		@total_ties = 0
	end

	def choose_item(item=nil)
		status = "FAIL"
		message = nil
		data = nil

		case item
		when 0,1,2
			@item = @@item_list[item]

			status = "SUCCESS"
			message = "ITEM_CHANGED"
		else
			@item, message = "INVALID_ITEM"
		end

		data = @item
		response = { status: status, message: message, data: data }
		response
	end

	def add_win
		@total_wins += 1
	end

	def add_lose
		@total_losses += 1
	end

	def add_tie
		@total_ties += 1
	end

end

class Computer < Player
	def initialize()
		@name = "Computer"
	end

	def choose_item
		item = rand(0..2)
		super(item)
	end
end

class Human < Player
	def initialize(name)
		@name = "Player #{name}"
	end

	def choose_item
		item = rand(0..2)
		super(item)
	end
end

