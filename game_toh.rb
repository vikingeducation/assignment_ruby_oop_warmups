
require_rlative 'platform.rb'
require_rlative 'disk.rb'

class Game

	def welcome
		puts "Welcome to the Tower of Hanoi game"
	end

	def setup

		platform = Platform.new

		platform.get_number_disks

		platform.validate_number_disks

		platform.add_disks

	end



	def instructions

	end



end

