
class Platform

	attr_accessor :disks, :pegs

	def initialize
		@disks = 0
		@move =
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

		if @disks < 0 || @disks.class != Fixnum

			get_number_disks

		end

	end

	def add_disks

		disk_number = @disks

		@disks.times do |disk|

			@pegs[0].unshift(Disk.new(disk_number))

			disk_number -= 1

		end

	end

	def render

	  @pegs.each do |peg|

	    peg.each do |disk|

	      if disk != nil

	        puts disk.image

	      else

	        puts " " * @disks

	      end

	    end

	  end

	end

	def make_move

		get_move

		validate_move(@move)

		from_peg = @pegs[@move[0] - 1]

		to_peg = @pegs[@move[1] - 1]

		if validate_move(@move)

			to_peg[index_top_disk + 1] = from_peg[index_top_disk]

			from_peg[index_top_disk] = nil

		end

	end

	def get_move

		puts "Please enter your move format \"from, to\" : "

		move = gets.chomp

		move = move.split(", ")

		@move = move.map { |character| character.to_i }

	end

	def validate_move_input(move)

		if move[0] < 0 || move[0] > 3 || move[1] < 0 || move[1] > 3

			puts "I wasn't able to parse your move"

			get_move

		end

	end

	def validate_move(move)

		from_peg = @pegs[move[0] - 1]

		to_peg = @pegs[move[1] - 1]

		#TODO add bigger than to Disk class && index_top_disk method
		if from_peg[index_top_disk].bigger_than?(to_peg[index_top_disk])

			true

		end

		false

	end

	def index_top_disk(array)

		#TODO

	end

end