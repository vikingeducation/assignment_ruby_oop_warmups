class TowerOfHanoi
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
    return false if towers[from].empty?

    return true if towers[to].empty?

    return true if towers[from] == towers[to]

    return true if towers[from].last.size > towers[to].last.size
  end

  # moves a Disk from one tower to another
  def move(from, to)
    towers[to].push(towers[from].pop)
  end

  # print out the current state of the towers
  def render
    1.upto(3) do |i|
      output = ""
      output += "Tower #{i}: "
      towers[i].each do |disk|
        output += "#{disk.size}, "
      end
      # trim trailing comma and space
      puts output[0..-3]
    end
  end

  # exits the game
  def exit_game
    puts "Goodbye!"
    exit
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
  tower.render
  p tower.valid_move?(1, 1)
  p tower.valid_move?(1, 2)
  p tower.valid_move?(1, 3)
  p tower.valid_move?(3, 1)
  p tower.valid_move?(2, 1)
  p tower.valid_move?(2, 3)
  p tower.valid_move?(3, 2)
  p tower.move(1, 2)
  p tower.towers[1]
  p tower.towers[2]
  p tower.towers[3]
  tower.render
end