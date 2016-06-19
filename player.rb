class Player
	@@item_list = ['rock','paper','scissors','quit']

	def initialize()
		@item = nil
	end

	def choose_item(item=nil)
		case item
		when 0
			@item = @@item_list[item]
		when 1
			@item = @@item_list[item]
		when 2
			@item = @@item_list[item]
		else
			@item = "INVALID_ITEM"
		end
	end
end

class Computer < Player
	def initialize()
	end

	def choose_item
		item = rand(0..2)
		super(item)
	end
end

class Human < Player
	def initialize()
	end


end

