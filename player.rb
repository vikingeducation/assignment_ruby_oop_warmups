class Player
	@@item_list = {0 => 'rock',1 =>'paper',2 =>'scissors',3 => 'quit'}

	def initialize()
	end

	def choose_item(item=nil)
		status = "FAIL"
		message = nil
		data = nil

		case item
		when 0,1,2
			@item = @@item_list[item]

			status = "SUCCESS"
			data = item
			message = "ITEM_CHANGED"
		else
			@item, message = "INVALID_ITEM"
		end

		data = @item
		response = { status: status, message: message, data: data }
		response
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

