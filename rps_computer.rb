class RPSComputer < RPSPlayer

  def initialize
    @name = "Oopy Rooby"
  end

  def select_move
    @move = @@valid_answers.shuffle.first
  end
end