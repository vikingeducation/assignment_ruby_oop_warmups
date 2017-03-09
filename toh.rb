# toh.rb
require 'pry'

# class TOH
class TOH
  @towers = Hash.new([])

  def initialize(height)
    @instructions = "Instructions:\n" \
                    "Enter where you'd like to move from and to\n" \
                    "seperated by a comma. For example: 1,3\n" \
                    "Enter 'q' to quit.\n"
    @height = height
    @towers = { 1 => [], 2 => [], 3 => [] }
    height.downto(1) do |val|
      @towers[1] << val
      @towers[2] << 0
      @towers[3] << 0
    end
  end

  def play
    system 'clear'
    puts 'Welcome to Tower of Hanoi'
    puts @instructions.to_s
    render
    play = true
    while play
      print 'Enter Move (q to quit):'
      move = gets.chomp
      if move.casecmp('q').zero?
        play = false
      else
        parse_move(move)
      end
    end
    render
    puts 'Thanks for playing! Good bye.'
  end

  def parse_move(move_made)
    move_arr = move_made.split(',')
    if valid_two_integers(move_arr)
      make_move(move_arr)
    else
      puts 'invalid move,  please re enter'
    end
  end

  def make_move(move_arr)
    move_from = move_arr[0].to_i
    move_to = move_arr[1].to_i
    index_from = tower_top_index(move_from)
    index_to = tower_top_empty_index(move_to)
    index_from = 0 if index_from == -1
    index_to = 0 if index_to == -1

    @towers[move_to][index_to] = @towers[move_from][index_from]
    @towers[move_from][index_from] = 0

    render
  end

  def valid_two_integers(arr)
    return false if arr.length != 2
    value_from = arr[0].to_i
    return false if value_from < 1 || value_from > 3
    value_to = arr[1].to_i
    return false if value_to < 1 || value_to > 3
    return false if value_from == value_to

    from = top_disk_width(value_from)
    to = top_disk_width(value_to)
    # puts "#{from} #{to}"
    return false if from.zero?
    return true if to.zero?
    return false if from > to

    true
  end

  def tower_top_index(tower)
    top_disk = -1
    (@height - 1).downto(0) do |i|
      top_disk = @towers[tower][i] > 0 ? i : top_disk
      break unless top_disk == -1
    end
    top_disk
  end

  def tower_top_empty_index(tower)
    empty_idx = -1
    0.upto(@height - 1) do |i|
      empty_idx = @towers[tower][i].zero? ? i : empty_idx
      break unless empty_idx == -1
    end
    empty_idx
  end

  def top_disk_width(tower)
    width = 0
    (@height - 1).downto(0) do |val|
      if width.zero?
        width = @towers[tower][val] > 0 ? @towers[tower][val] : width
      end
    end
    width
  end

  def render
    @board_width = (@height * 3) + 3
    # puts
    # @towers.each { |key, value| puts "#{key} is #{value}" }

    # top of board
    print_horizontal_line
    @height.times do |index|
      print_row(index)
    end
    # bottom of board
    print_horizontal_line
    print_tower_numbers
    print_horizontal_line
  end

  def print_row(index)
    disk_width = @towers[1][@height - 1 - index]
    disk = make_disk(disk_width).ljust(@height + 1)
    disk_width = @towers[2][@height - 1 - index]
    disk += ' ' + make_disk(disk_width).ljust(@height + 1)
    disk_width = @towers[3][@height - 1 - index]
    disk += ' ' + make_disk(disk_width).ljust(@height + 1)

    print disk
    puts
  end

  def make_disk(width)
    disk = ''
    width.times do |_index|
      disk += 'O'
    end
    disk
  end

  def print_horizontal_line
    @board_width.times { print '-' }
    puts
  end

  def print_tower_numbers
    out = '1'.center(@height + 1)
    out += '2'.center(@height + 1)
    out += '3'.center(@height + 1)
    puts out
  end
end

t = TOH.new(3)
t.play
