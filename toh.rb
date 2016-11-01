class TowerOfHanoi
	attr_accessor :num_discs, :p1, :p2, :p3
	

	def initialize(num_discs=3)
		@num_discs = num_discs
		@p1 = Pillar.new(1)
		@p2 = Pillar.new(2)
		@p3 = Pillar.new(3)
		@num_to_pillar = { '1' => @p1, '2' => @p2, '3' => @p3 }
	end



	def setup
		disc_array = []
		@num_discs.times do |size| # size 0 -> smallest
			disc_array << Disc.new(size) 
		end
		p1.store(disc_array)
	end

	def run
		setup
		loop do 
			render
			puts "Grab disc from which pillar? (1/2/3)"
			from = gets.chomp
			puts "Place disc on which pillar? (1/2/3)"
			to = gets.chomp
			if !['1','2','3'].include?(from) || !['1','2','3'].include?(to)
				puts "Invalid input. Try again."
				next
			end
			@num_to_pillar[from].move_disc_to(@num_to_pillar[to])
			break if is_win?
		end
	end

	def is_win?
		@p3.stack.length == @num_discs
	end

	def render
		pillars = [@p1, @p2, @p3]
		pillars.each do |pillar|
			pillar.render
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

	def initialize(num)
		@stack = []
		@smallest = nil
		@num = num
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
		if @stack.length == 0
			@smallest = nil 
		else
			@smallest = @stack[0].size
		end
	end

	def valid_move?(new_pillar)
		return false if @smallest.nil?
		return true if new_pillar.smallest.nil?
		@smallest < new_pillar.smallest
	end

	def render
		puts @num
		@stack.each do |disc|
			puts '#' * (disc.size+1) 
		end

	end

end

game = TowerOfHanoi.new
game.run






