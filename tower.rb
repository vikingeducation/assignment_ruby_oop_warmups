require_relative 'disk'

class Tower

	LEFT_TOWER   = 1
	MIDDLE_TOWER = 2
	RIGHT_TOWER  = 3

	attr_accessor :name, :disks

	def initialize(name)
		@disks = Array.new
		@name = name
	end

	def add_disk(disk)
		@disks << disk
	end

	def remove_disk
		disk = @disks.pop
	end

	def size
        @disks.size
    end

    def reverse
    	@disks.reverse
    end

    def last
    	@disks.last
    end
end
