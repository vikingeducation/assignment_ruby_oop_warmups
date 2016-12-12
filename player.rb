class Player
	# type 0 is computer, type 1 is player
	attr_accessor :score, :cur_choice, :name, :type

	def initialize(name, type)
		@type = type
		@score = 0
		@cur_choice = ""
		@name = name
	end

	def make_choice
		if @type == 0
			@cur_choice = ["s", "r", "p"].sample
		else
			puts "#{@name}, Please enter your choice"
			@cur_choice = gets.chomp
		end
	end
end