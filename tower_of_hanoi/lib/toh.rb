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
#---------------------------------------------------#



class Tower
	attr_reader :stack

	def initialize(stack=[],starting_tower=false)
		@stack = stack
		@starting_tower = starting_tower
	end

	def move_disk(to_tower)
		if check_move(to_tower)
			to_tower.stack.push(@stack[-1])
			@stack.pop
		else
			puts "INVALID MOVE"
		end
	end

	def check_move(to_tower)
		return true if to_tower.stack.empty?
		return true if @stack[-1].width <= to_tower.stack[-1].width
		return false
	end

	def render_tower
		tower = ""
		stack.reverse.each{ |disk|
			tower << "#{disk.render}\n"
		}
		return tower.chomp
	end
end



#---------------------------------------------------#
class Puzzle
	attr_reader :board, :user_input
	def initialize
		#Init Disks
		@xsmall_disk, @small_disk, @medium_disk, @large_disk = Disk.new(1), Disk.new(2), Disk.new(3), Disk.new(4)

		#Init Towers
		@tower_a = Tower.new([@large_disk, @medium_disk, @small_disk, @xsmall_disk],true)
		@tower_b = Tower.new([],false)
		@tower_c = Tower.new([],false)

		@board = [@tower_a, @tower_b, @tower_c]
	end

	def run
		loop do
			render_board

			ask_input

			break if @user_input == 'Q'

			@user_input = @user_input.split(" ").map { |choice| choice.to_i }

			@board[@user_input[0]-1].move_disk(@board[@user_input[1]-1])

			break if check_win
		end
	end

	def check_win
		if @board[1].stack.size == 4 || @board[2].stack.size == 4
			return true
		end
			return false
	end

	def render_board
		game_board = ""
		@board.each{ |tower|
			game_board << "#{tower.render_tower} _ "
		}
		print game_board
	end

	def ask_input
		puts "\nEnter From and To Tower to move the top disk. (Enter 1,2,3 like '1 2' == from 1 to 2 ). Q for quit"
		@user_input = gets.chomp
	end
end