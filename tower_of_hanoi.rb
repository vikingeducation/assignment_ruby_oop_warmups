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

  def move(from, to)
    towers[to].push(towers[from].pop)
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
  p tower.towers[1]
  p tower.towers[2]
  p tower.towers[3]
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
end