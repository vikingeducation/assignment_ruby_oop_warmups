class ComputerPlayer < Player
  def choose_move
    choices = [Rock.new, Paper.new, Scissors.new]
    @move = choices[rand(2)]
  end
end