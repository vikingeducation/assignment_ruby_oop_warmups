class Tower
	attr_reader :name , :disk_set, :row_size

	def initialize(name, disk_set=[])
		@name = name
		@disk_set = disk_set
		@row_size = disk_set.size
	end

	def disk_push(disk)
		@disk_set << disk
		@row_size = disk_set.size
	end

	def disk_pop()

	end
end