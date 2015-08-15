class GameAuth < Auth
	def initialize(model)
		@model = model
	end

	def valid_difficulty?(d)
		d = d.to_i
		if d >= GameModel.min_disks && d <= GameModel.max_disks
			return true
		else
			@error = "Invalid difficulty value: #{d.to_s}"
			return false
		end
	end

	def valid_from?(from)
		if ! ['1', '2', '3'].include?(from)
			@error = "Invalid stack origin number: #{from.to_i.to_s}"
			return false
		elsif ! @model.game[from.to_i - 1] || @model.game[from.to_i - 1].empty?
			@error = "Invalid stack origin number: #{from.to_i.to_s}"
			return false
		end
		return true
	end

	def valid_to?(to)
		from = @model.from
		if ! ['1', '2', '3'].include?(from)
			@error = "Invalid stack destination number: #{to.to_i.to_s}"
			return false
		elsif ! @model.game[from.to_i - 1] || ! @model.game[to.to_i - 1]
			@error = "Cannot move from: #{from.to_i.to_s} to: #{to.to_i.to_s}"
			return false
		elsif @model.game[to.to_i - 1].first && @model.game[from.to_i - 1].first > @model.game[to.to_i - 1].first
			@error = "Cannot move larger disk onto smaller disk"
			return false
		end
		return true
	end
end