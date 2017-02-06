class Player
  def initialize(name)
    @name = name
    @move = nil
  end

  def move
    @move
  end

  def move=(move)
    @move = move
  end

  def name
    @name
  end
end