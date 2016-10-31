class ToH
  def initialize(discs = 3)
    @peg1 = []
    @peg2 = []
    @peg3 = []
    @discs = discs
  end

  def render
    puts @peg1
    puts @peg2
    puts @peg3
  end

  def setup
    discs.downto(0) do |disc|
      @peg1 << disc
    end
  end

  def user_move

  end

  def is_valid?

  end

  def game_over?

  end
end

class 