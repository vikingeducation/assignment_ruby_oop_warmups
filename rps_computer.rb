class Computer < Player

  def initialize
    @name = "Skynet"
  end

  def select_move
    @move = VALID_ANSWERS.shuffle.first
  end
end