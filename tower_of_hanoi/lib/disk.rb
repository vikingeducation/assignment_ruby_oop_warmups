class Disk
	attr_reader :size

	def initialize(disk_size)
		@size = disk_size
	end

	def compare_size(compared_size)
		return size - compared_size
	end

end