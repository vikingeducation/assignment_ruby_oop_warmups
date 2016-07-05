
class Platform

	PEGS = [
					[],
					[],
					[]
				]

	def initialize
		@disks
	end

	def get_number_disks

		puts "Please enter the number of disks you would like to play with"

		@disks = gets.chomp.to_i

	end

	def validate_number_disks

		unless @disks < 0 || @disks.class != Fixnum

			get_number_disks

		end

	end

	def add_disks

		disk_number = @disks

		@disks.times do |disk|

			PEGS[0] << Disk.new(disk_number)

			disk_number -= 1

		end

	end


end