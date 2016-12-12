class Disk
	
	LEFT_TOWER   = 1
	MIDDLE_TOWER = 2
	RIGHT_TOWER  = 3

	attr_accessor :weight, :cur_tower

	def initialize(weight)
		@weight = weight
	end
end