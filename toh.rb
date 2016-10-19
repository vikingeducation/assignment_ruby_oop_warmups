#!/usr/bin/ruby

class TowerOfHanoi

	def initialize(discs)
		@discs = discs
	end

	def load_towers(discs, towers)
		discs.downto(1) { |disc| towers[1] << disc}
	end

	def valid_input(move)

		if (move.length == 3 && (1..3) === move[0].to_i && (1..3) === move[2].to_i && move[1] === ',' && move[0] != move[2])
			return true
		else
			puts ("Please provide a move in the format 'X,Y'")
			return false
		end
	end

	def valid_move(towers, move)
		
		if (towers[move[0]].empty?)
			false
			puts "There are no disks on tower #{move[0]} to move"
		elsif (towers[move[1]].length > 0)
			if (towers[move[0]].last > towers[move[1]].last)
				false
				puts "You can't place a larger disc on a smaller one."
			else
				true
			end
		else
			true
		end

	end

	def make_move(towers, move)
		towers[move[1]] << towers[move[0]].pop
	end

	def calculate_padding(disc)
		disc_size = disc.length
		width = 6
		return width - disc_size
	end

	def draw_discs(board, towers)
		towers.each do | tower, discs |
			display = [' ', ' ', ' ']
			i = 0
			padding = 6
			discs.each do | disc |
				disc = 'o' * disc
				padding = calculate_padding(disc.to_s)
				disc = disc + ' ' * padding
				display[i] = disc
				i += 1
			end
			board << display.sort_by { |x| x.length }.reverse
		end
	end

	def render(discs, towers)
		board = []	
		top, middle, bottom = '', '' ,''
		draw_discs(board, towers)
		board.each_with_index do | tower, q |
			tower = tower.sort_by { |x| x.length }.reverse
			tower.each_with_index do | disc, i |
				case i
					when 2
						top = top + '%6.6s' % disc
					when 1
						middle= middle + '%6.6s' % disc
					when 0 
						bottom = bottom + '%6.6s' % disc
					else
				end
			end
		end
		puts "Current Board:"
		puts top
		puts middle
		puts bottom
		puts '1     2     3     '
	end

	def intro()
		puts "Welcome to Tower of Hanoi!"
		puts "Instructions:"
		puts "Enter where you'd like to move from and to"
		puts "in the format '1,3'. Enter 'q' to quit."
	end

	def play()
	
		#initalize
		towers = { 1 => [], 2 => [], 3 => [] }
		load_towers(@discs, towers)
		final = towers[1].dup
		intro
		render(@discs, towers)

		while true
			
			puts "Enter move "
			print ">"
			move = gets.chomp

			if move.downcase == 'q'
				puts "Thank you for playing Towers of Hanoi"
				break
			end

			if (valid_input(move))
				move = move.split(',').map{|s| s.to_i}
				if (valid_move(towers, move))
					make_move(towers, move)
				else
				end
			end
			render(@discs, towers)
			if towers[2] == final || towers[3] == final
				puts "Congratulations you won!"
				break
			end
		end
	end
end
