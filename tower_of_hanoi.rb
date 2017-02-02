class TowerOfHanoi
  QUIT_OPTIONS = ["q", "quit", "exit"]

  attr_accessor :towers, :starting_disks

  def initialize(starting_disks = 3)
    @starting_disks = starting_disks
    
    @towers = { 1 => [], 2 => [], 3 => [] }
    
    build_towers
  end

  # initialize the first tower with Disks
  def build_towers
    starting_disks.downto(1) do |size|
      disk = Disk.new(size)
      towers[1].push(disk)
    end
  end

  # checks if requested move is valid
  def valid_move?(from, to)
    has_disk?(from) && in_range?(from) && in_range?(to) && proper_stacking?(from, to)
  end

  # checks if there are any disks in the tower
  def has_disk?(from)
    unless towers[from].empty?
      return true
    else
      puts "That tower has no disks to move."
      return false
    end
  end

  # checks if the requested from/to tower is within the correct range
  def in_range?(tower)
    if (1..3).include?(tower)
      return true
    else
      puts "That input is not a valid tower."
      return false
    end
  end

  # check if we're correctly moving a disk from one tower to another
  def proper_stacking?(from, to)
    if towers[to].empty? || towers[to].last.size > towers[from].last.size
      return true
    else
      puts "You need to put a smaller disk on top of a larger one."
      return false
    end
  end

  # moves a Disk from one tower to another
  def move_disk(from, to)
    towers[to].push(towers[from].pop)
  end

  # prompts the player for a move/input
  def get_player_move
    print "\nPlease enter your move: "
    move = gets.chomp.split(",")

    if QUIT_OPTIONS.include?(move.first)
      return move.first
    elsif move.length == 2
      return move.map(&:to_i)
    else
      puts "\nInvalid input. Please try again.\n"
    end
  end

  # print out the current state of the towers
  def render
    puts "\nCurrent state:"

    1.upto(3) do |i|
      output = ""
      output += "Tower #{i}: "
      towers[i].each do |disk|
        output += "#{disk.size}, "
      end
      
      # trim trailing comma and space
      # puts output[0..-3]
      last_comma = output.rindex(",")
      unless last_comma.nil?
        output = output[0..last_comma - 1]
      end

      puts output
    end
  end

  # check if the game is over
  def victory?
    all_disks_in_place? && all_disks_in_order?(3)
  end

  # check if all Disks are on the last tower
  def all_disks_in_place?
    towers[1].length == 0 && towers[2].length == 0 && towers[3].length == starting_disks
  end

  # check if all Disks are in the right order
  def all_disks_in_order?(tower)
    counter = starting_disks
    towers[tower].each do |disk|
      return false unless disk.size == counter
      counter -= 1
    end

    true
  end

  # displays instructions
  def display_instructions
    puts "Welcome to Tower of Hanoi!"
    puts "Instructions: "
    puts "Enter where you'd like to move from and to"
    puts "in the format '1, 3'. Enter 'q' to quit."
  end

  # exits the game
  def exit_game
    puts "\nGoodbye!"
    exit
  end

  # print congratulatory message
  def congratulate
    puts "\nCongratulations, you won!"
  end

  # main method to play game
  def play
    display_instructions
    render

    begin
      loop do
        from, to = get_player_move

        exit_game if QUIT_OPTIONS.include?(from)
        next if from.nil?

        next unless valid_move?(from, to)

        move_disk(from, to)
        render

        if victory?
          congratulate
          break
        end
      end
    rescue Interrupt
      exit_game
    end
  end
end


class Disk
  attr_accessor :size

  def initialize(size = 1)
    @size = size
  end
end


if $0 == __FILE__
  tower = TowerOfHanoi.new
  tower.play
end