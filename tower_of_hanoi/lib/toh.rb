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