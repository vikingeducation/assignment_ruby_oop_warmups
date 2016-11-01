class TowerOfHanoi
	attr_accessor :num_discs, :p1, :p2, :p3

	def initialize(num_discs)
		@num_discs = num_discs
		@p1 = Pillar.new
		@p2 = Pillar.new
		@p3 = Pillar.new
	end

	def setup
		disc_array = []
		@num_discs.times do |size| # size 0 -> smallest
			disc_array << Disc.new(size) 
		end
		p1.store(disc_array)
	end

	def render
		# Example
		#	#
		#	##
		#	###
		#	1   
		# 2
		# 3
		pillars = [@p1, @p2, @p3]
		pillars.each do |pillar|
			puts pillar
		end
	end

end

class Disc

	attr_reader :size

	def initialize(size)
		@size = size
	end
end

class Pillar 
	attr_accessor :stack
	attr_reader :smallest

	def initialize
		@stack = []
		@smallest = nil
	end

	def store(discs)
		@stack = discs
		@smallest = discs[0]
	end

	def move_disc_to(new_pillar)
		if valid_move?(new_pillar)
			new_pillar.stack.unshift(@stack.shift)
			update_smallest
			new_pillar.update_smallest
		end
	end

	def update_smallest
		@smallest = @stack[0]
	end

	def valid_move?(new_pillar)
		return false if @smallest.nil?
		return true if new_pillar.smallest.nil?
		@smallest < new_pillar.smallest
	end

	def to_s
		@stack.reverse.each do |disc|
			puts '#' * (disc.size+1) 
		end
	end

end








