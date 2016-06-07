#Nouns : Disk - attr: size, Tower - attr: index
#Verbs : push/pop disk to/from a tower
#Contraints : larger disk cannot be placed on a smaller disk
#Contraints : only 1 disk can be moved around at a time
#Contraints : nothing cannot be poped from an empty tower
#Contraints : there is no limit on height of the tower
require 'pry'

class Disk
  attr_reader :size
  def initialize(size = 0)
    @size = size
  end

  def ==(other_disk)
    other_disk ? size == other_disk.size : nil
  end
end

class Tower
  attr_reader :disks
  def initialize(index = 0, num_disk = 0)
    @index = index
    @disks = []
    if num_disk != 0
      (1..num_disk).each { |size| @disks.unshift(Disk.new(size)) }
    end
  end

  def push(disk)
    if !@disks.empty? && @disks.last.size <= disk.size
      return nil
    end
    @disks << disk
  end

  def pop
    if @disks.empty?
      return nil
    end
    @disks.pop
  end

  def ==(other_tower)
    self.disks == other_tower.disks
  end

  def nthDiskSize(n)
    @disks[n] ? @disks[n].size : 0
  end

  def self.validate(source_tower, dest_tower)
    src_disk_last  = source_tower.disks.last
    if src_disk_last == nil
      puts "Source Tower is empty!"
      return false
    end
    dest_disk_last = dest_tower.disks.last
    if dest_disk_last != nil && dest_disk_last.size <= src_disk_last.size
      puts "larger disk cannot be place on top of smaller disk"
      return false
    end
    return true
  end
end

class Game
  def initialize(height)
    @towers = [Tower.new(0, height), Tower.new(1), Tower.new(2)]
    @height = height
    @winning_tower = Tower.new(4, height)
  end

  def play
    welcome_msg
    render

    # Game loop
    loop do
      puts "Enter Move >"

      # input validation
      from, to = validate_input

      # move disks from one tower to another
      move(from, to)

      # render the state of the towers visually
      render

      break if check_winner
    end

  end

  private

  def render
    level = @height - 1
    while level >= 0
      (0..2).each do |i|
        print ' ' * (@height - @towers[i].nthDiskSize(level))
        print '=' * @towers[i].nthDiskSize(level)
        print '|'
        print '=' * @towers[i].nthDiskSize(level)
        print ' ' * (@height - @towers[i].nthDiskSize(level))
      end
      puts
      level -= 1
    end
    (0..2).each { |i| print "-" * @height + i.to_s + "-" * @height }
    puts
  end

  def move(source_tower, dest_tower)
    if Tower.validate(@towers[source_tower], @towers[dest_tower])
      @towers[dest_tower].push @towers[source_tower].pop
    end
  end

  def check_winner
    if @towers[2] == @winning_tower
      puts "Congratulations! You won"
      return true
    end
  end

  def welcome_msg
    greet_string = <<-GREETING
    # Welcome to Tower of Hanoi!
    # Instructions:
    # Enter where you'd like to move from and to
    # in the format [0,2] . Enter 'q' to quit.
    GREETING
    puts greet_string
    puts "Current Board state:\n\n"
  end

  def validate_input
    from = 0
    to   = 0
    loop do
      raw_input = gets.chomp
      if raw_input == 'q'
        exit
      else
        from, to = raw_input.split(",").map(&:to_i)
        break if (0..2).cover?(to) && (0..2).cover?(from)
        puts "Please enter a valid input"
      end
    end
    [from, to]
  end

end

game = Game.new(3)
game.play
# Answer
# 0,2
# 0,1
# 2,1
# 0,2
# 1,0
# 1,2
# 0,2
