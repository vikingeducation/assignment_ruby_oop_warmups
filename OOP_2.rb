# OOP 2: Tower of Hanoi

class Tower
  def initialize(name, rings)
    @name = name
    @rings = rings
  end

  def to_s
    @name
  end

  def pop
    @rings.pop
  end

  def push(ring)
    @rings.push ring
  end

  def height
    @rings.length
  end
end

class Hanoi
  def initialize(rings)
    @left = Tower.new("left", [*(1..rings)].reverse)
    @middle = Tower.new("middle", [])
    @right = Tower.new("right", [])
  end

  def move(rings, from, to, other)
    if rings == 1
      ring = from.pop
      puts "Move ring #{ring} from #{from} to #{to}"
      to.push ring
    else
      move(rings-1, from, other, to)
      move(1, from, to, other)
      move(rings-1, other, to, from)
    end
  end

  def solve
    move(@left.height, @left, @right, @middle)
  end
end

Hanoi.new(ARGV[0].to_i).solve





