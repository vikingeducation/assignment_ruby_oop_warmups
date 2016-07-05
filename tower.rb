class Tower < Array
  attr_reader :tower

  def initialize(height, start = nil)
    @height = height
    start ? start_tower : @tower = [nil] * @height
  end

  def start_tower
    @tower = (1..@height).to_a.reverse
  end

  def get_top_piece
    @tower.last == nil ? @num_index = @tower.index(nil) - 1 : @num_index = -1
    @tower[@num_index]
  end

  def add(piece)
    get_top_piece
    nil_index = @tower.index(nil)
    @tower[nil_index] = piece
  end

  def remove
    get_top_piece
    @tower[@num_index] = nil
  end

end
