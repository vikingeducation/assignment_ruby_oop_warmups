require_relative 'game_auth.rb'

class GameModel < Model
	@@min_disks = 3
	@@max_disks = 10

	attr_accessor :game, :difficulty, :from, :to, :moves

	def initialize
		super(:auth => GameAuth.new(self))
	end

	def clear
		@game = []
		@difficulty = 3
		@from = nil
		@to = nil
		@moves = 0
	end

	def oops
		@from = nil
		@to = nil
	end

	def difficulty=(value)
		@difficulty = value
		create
		@difficulty
	end

	def from=(value)
		@from = value
	end

	def to=(value)
		@to = value
		move!
		@to
	end

	def win?
		@game[2].join == (0...@difficulty.to_i).to_a.join
	end

	def to_s
		size = @difficulty.to_i
		width = size + 1
		lines = []
		size.times do |i|
			lines << ''
			@game.each do |stack|
				normalized = stack.join.rjust(size, '#').split('')
				string = ''.ljust(width)
				char = normalized[i] 
				if char != '#'
					number = char.to_i
					string = (number + 1).to_s.ljust(number + 1)
					string = color(number, string) + (' ' * (width - (number + 1)))
				end
				lines[i] += string
			end
		end
		lines << ('_' * size).ljust(width) * 3
		lines << (1..3).to_a.map {|i| i.to_s.center(width)}.join
		string = ''
		lines.each do |line|
			string += line + "\n"
		end
		string
	end

	def self.min_disks
		@@min_disks
	end

	def self.max_disks
		@@max_disks
	end

	private
		def move!
			@moves += 1
			@from = @from.to_i - 1
			@to = @to.to_i - 1
			disk = @game[from].shift
			@game[@to].unshift(disk)
			@from = nil
			@to = nil
			@game
		end

		def color(number, string)
			code = ((number % 15) + 1).to_s
			bg = "\e[48;5;#{code}m"
			close = "\e[0m"
			"#{bg}#{string}#{close}"
		end

		def create
			first_tower = []
			@difficulty.to_i.times do |i|
				first_tower << i
			end
			@game = [first_tower, [], []]
		end
end