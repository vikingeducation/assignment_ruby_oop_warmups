class TowerOfHanoi

	def initialize(num_discs)
		@num_discs = num_discs
		@p1 = Pillar.new
		@p2 = Pillar.new
		@p3 = Pillar.new
	end

	def setup
		disc_array = []
		@num_discs.times do |size| # size 0 -> smallest
			disc_array << Disk.new(size) 
		end
		p1.stack = disc_array
	end

end

class Disc

	def initialize(pillar, size, position)
		@pillar = pillar
		@size = size
		@position = position
	end

	def move

	end

end

class Pillar 

	def initialize

	end

	def move_disc_to(new_pillar)
	end

end

class Board # rendering

end 







