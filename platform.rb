
class Platform



	def initialize
		@disks
		@pegs = [
					[],
					[],
					[]
				]
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

			@pegs[0] << Disk.new(disk_number)

			disk_number -= 1

		end

	end

	def render
  		puts "Current Board:\n"
 		 @disks.times do |level|
 		 	@platform.each do |peg|
  				print peg[level].rjust((@disks + 1), " ")
  			end
  			print "\n"
  		end
  		print "\n"
 	 end


end