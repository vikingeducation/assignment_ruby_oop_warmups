class Disk
	attr_reader :width

	def initialize(width=0)
		@width = width
	end

	def is_smaller?(comparison_disk)
		@width <= comparison_disk.width ? true : false
	end

	def render
		return "#{"*" * @width}"
	end
end

class Tower
	attr_reader :stack

	def initialize(stack=[],starting_tower=false)
		@stack = stack
		@starting_tower = starting_tower
	end

	def move_disk(to_tower)
		to_tower.stack.push(@stack[-1])
		@stack.pop
	end

	def render_tower
		tower = ""
		stack.reverse.each{ |disk|
			tower << "#{disk.render}\n"
		}
		return tower
	end

end