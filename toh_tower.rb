class Tower
  attr_accessor :tower, :num_discs

 	def initialize(num_discs)
    @num_discs = num_discs
    @tower = []

    @num_discs.times do |index|
      @tower << Disc.new(num_discs - index)
    end
  end

  def tower_size
     @tower.size
  end

  def top_disc
    @tower.last
  end

  def add_disc(disc)
    if tower.size == 0 || top_disc > disc
      tower.push(disc)
      true
    else
      false
    end
  end

  def remove_disc
    if tower.size > 0
      tower.pop
      true
    else
      false
    end
  end
end

