# refactored and more OOP version -- Tower of Hanoi
# class Player
#   methods: move, quit
# class Tower
#   methods: chank_move, display
# class Game
#   methods: game_over, start, win?
require 'pry'

class Tower
  attr_reader :col_1, :col_2, :col_3, :ini_arrange

  def initialize num_disks
    @num_disks  = num_disks
    @ini_arrange = Array(1..num_disks)
    @col_1 = @ini_arrange
    @col_2 = []
    @col_3 = []
  end

  def find_colmn input
    case input
    when 1
      @col_1
    when 2
      @col_2
    when 3
      @col_3
    else
      puts "invaid input!"
    end
  end

  def valid_move? arr
    disk_from = find_colmn(arr[0])[0]
    disk_to   = find_colmn(arr[1])[0]
    return true if (disk_from != nil) && (disk_to.nil? || disk_from < disk_to)
    false
  end

  def move arr
    # binding.pry
    if valid_move? arr
      disk_move = find_colmn(arr[0]).shift
      find_colmn(arr[1]).unshift(disk_move)
    else
      puts "Move failed! :("
    end
  end

  def array_fill arr
    result = []
    @num_disks.times do |i|
      if arr[i] != nil
        result << arr[i]
      else
        result << 0
      end
    end
    result
  end

  def display_one_line n
    move_distance = @num_disks + 2
    unless n.nil?
      ("=" * n).rjust(move_distance) + "|" + ("=" * n).ljust(move_distance)
    else
      " ".rjust(move_distance) + "|" + " ".ljust(move_distance)
    end
  end

  def display_all
    @num_disks.times do |i|
      print display_one_line array_fill(col_1).sort[i]
      print display_one_line array_fill(col_2).sort[i]
      print display_one_line array_fill(col_3).sort[i]
      puts
    end
  end

end

class Player
  attr_reader :input, :output

  def warning
    puts "wrong input, please try again"
  end

  def quit?
    true if @input == 'q'
  end

  def input_data
    @input = gets.chomp.downcase
  end

  def move_instrcution
    puts "Please type the move in the format '1,2' "
    puts "to move the disk from column 1 to column 2"
  end

  def move
    move_instrcution
    while true
      input_data
      if /\d.*,.*\d/ =~ @input
        @output = []
        @output = @input.split(",").map { |x| x.to_i }
        break
      elsif @input == 'q'
        break
      else
        warning
      end
    end
  end

end

class Game

  def welcome
    puts "Welcome to Tower of Hanoi!"
    puts "If you want to start the game"
    puts "please type game_new = Game.new game_new.start to start"
    puts "During the game, you can type 'q' to quit at any time. "
  end

  def disk_num_input
    puts "how many disks do you want to play?"
    gets.chomp
  end

  def game_initialize
    # binding.pry
    @tower = Tower.new(disk_num_input.to_i)
    @player = Player.new
  end

  def show_columns
    @tower.display_all
  end

  def playing
    @player.move
    @tower.move @player.output if /\d.*,.*/ =~ @player.input
  end

  def game_process
    until game_over
      show_columns
      playing
      if win?
        puts "Good job"
        break
      end
    end
  end

  def start
    welcome
    game_initialize
    game_process
    good_bye
  end

  def good_bye
    puts "hope you enjoy the game"
  end

  def game_over
    true if @player.quit?
  end

  def win?
    true if (@tower.col_2 == @tower.ini_arrange) || (@tower.col_3 == @tower.ini_arrange)
  end


end
