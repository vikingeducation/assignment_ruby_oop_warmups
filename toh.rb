require_relative 'tower'

class TowerOfHanoi

	LEFT_TOWER   = 1
	MIDDLE_TOWER = 2
	RIGHT_TOWER  = 3

	def initialize
		@moves_so_far = 0
		@left_tower 	 = Tower.new("LEFT")
		@middle_tower = Tower.new("MIDDLE")
		@right_tower  = Tower.new("RIGHT")
	end

	def create_game
		@good_input_received = false
		@game_not_won = true
		@quit_not_received = true
		puts "Hello Player!!"
		unless @good_input_received
			puts "Please enter number of disks to play (number should be between 1 and 20) :"
			@number_of_disks = gets.chomp.to_i
			while (! @number_of_disks.is_a?(Integer)) || @number_of_disks < 1 || @number_of_disks > 20
				puts "Number is no good! Please enter again (number should be between 1 and 20) :"
				@number_of_disks = gets.chomp.to_i
			end
			@good_input_received = true
		end
		puts "Thanks, you'll be playing with #{@number_of_disks} disks."
		puts "Now try to move all disks from left tower to right tower"
		@weight_of_heaviest = @number_of_disks * 2 - 1
		@number_of_disks.downto(1) do |item|
			new_disk = Disk.new(item * 2 - 1)
			@left_tower.add_disk new_disk
		end
	end

	def print_game_manual
		puts "Here is the current state of the game:"
		render
		puts "Whenever, you want to see state again, please enter 'render'"
		puts "Unless you type 'quit' the game will continue and you have to select your move"
		puts "To select a move, please input two integers between 1 and 3 with a space in the middle"
		puts "1 is left tower, 2 is middle tower and 3 is the right tower"
		puts "For example to move from middle to left, please enter '2 1'"
		puts "Now lets start! Enter your move"
	end

	def play
		create_game
		print_game_manual
		while(@game_not_won && @quit_not_received)
			move_from_to = gets.chomp
			if check_input move_from_to
				if move_from_to == 'render'
					render
					puts "Enter your next move"
				elsif move_from_to == 'quit'
					@quit_not_received = false
					puts "Quitting game...Thanks for playing"
				else
					move_from_to_array = move_from_to.split(" ")
					number_of_disks_in_right_tower = move move_from_to_array[0].to_i, move_from_to_array[1].to_i
					puts "Moves Played : #{@moves_so_far}"
					if number_of_disks_in_right_tower == @number_of_disks
						@game_not_won = false
						puts "You won...Good job!"
						render
					else
						puts "Enter your next move"
					end
				end
			else
				puts "Bad input received, please either type 'render' or 'quit' or two numbers with a space, like '2 1'"
			end
		end
	end

	def check_input (move_from_to_string)
		unless move_from_to_string == 'quit' || move_from_to_string == 'render' || move_from_to_string.split(" ").size == 2
			false
		else
			true
		end

	end

	def render
		puts "Moves Played : #{@moves_so_far}"
		puts "########## LEFT TOWER ##########"
		puts
		@left_tower.reverse.each_with_index do |item, index|
			str_to_print = "0" * item.weight
			puts str_to_print.center(@weight_of_heaviest, " ")
		end
		puts "########## MIDDLE TOWER ##########"
		puts
		@middle_tower.reverse.each_with_index do |item, index|
			str_to_print = "0" * item.weight
			puts str_to_print.center(@weight_of_heaviest, " ")
		end
		puts "########## RIGHT TOWER ##########"
		puts
		@right_tower.reverse.each_with_index do |item, index|
			str_to_print = "0" * item.weight
			puts str_to_print.center(@weight_of_heaviest, " ")
		end
	end

	def move(from_tower, to_tower)
		if from_tower == to_tower
			puts "Move not possible! Please select another move"
		else
			if from_tower == LEFT_TOWER && @left_tower.size > 0
				disk = @left_tower.remove_disk
				if to_tower == MIDDLE_TOWER
					if check_move disk, @middle_tower.last
						@middle_tower.add_disk disk
					else
						@left_tower.add_disk disk
					end
				else
					if check_move disk, @right_tower.last
						@right_tower.add_disk disk
					else
						@left_tower.add_disk disk
					end
				end
			elsif from_tower == MIDDLE_TOWER && @middle_tower.size > 0
				disk = @middle_tower.remove_disk
				if to_tower == LEFT_TOWER
					if check_move disk, @left_tower.last
						@left_tower.add_disk disk
					else
						@middle_tower.add_disk disk
					end
				else
					if check_move disk, @right_tower.last
						@right_tower.add_disk disk
					else
						@middle_tower.add_disk disk	
					end
				end
			elsif @right_tower.size > 0
				disk = @right_tower.remove_disk
				if to_tower == RIGHT_TOWER
					if check_move disk, @left_tower.last
						@left_tower.add_disk disk
					else
						@right_tower.add_disk disk
					end
				else
					if check_move disk, @middle_tower.last
						@middle_tower.add_disk disk
					else
						@right_tower.add_disk disk
					end
				end
			else
				puts "Move not possible! Please select another move"
			end
		end
		@right_tower.size
	end

	def check_move(from_disk, to_disk)
		unless from_disk.nil?
			from_weight = from_disk.weight
			unless to_disk.nil?
				to_weight = to_disk.weight
				if from_weight < to_weight
					@moves_so_far += 1
					true
				else
					puts "Move illegal! Please select another move"
					false
				end
			else
				@moves_so_far += 1
				true
			end
		else
			puts "Move not possible! Please select another move"
			false
		end
		
	end
end

game = TowerOfHanoi.new
game.play