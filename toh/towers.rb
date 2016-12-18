class Towers
  attr_accessor :tower
  def initialize(discs=3)
    @discs = discs
    @tower = [ build, [], [] ]

  end

  def build
    first = []
    (1..@discs).each do |n|
      first.unshift(n)
    end
    first
  end

  def render
    space = @discs + 2
    (0..@discs).reverse_each do |row|
      (0...@discs).each do |tower|
        print @tower[tower][row].nil? ? ' '.ljust(space) : ("o" * @tower[tower][row]).ljust(space)
      end
      puts
    end
    (1..@discs).each { |n| print n.to_s.ljust(space)}
    puts
  end




end
