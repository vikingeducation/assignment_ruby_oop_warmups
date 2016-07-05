# RPS class
#   initialize (players or computer)
#   play until win
#   win condition
  # player class
  # computer class


class RPS

  def initialize
    @player = Player.new
    @comp = Computer.new
  end

  def play 
    @player_move = @player.move
    @comp_move = @comp.move
    
    until win?
      play 
    end
    
  end

  def win?
    if @player_move != @computer_move
      return true
    end
    false
  end

  def who_won?
    players = ["computer", "you"]
    moves = [@comp_move, @player_move]

    if moves.include?("r") && moves.include?("p")
      i = moves.index("p")
      return players[i]
    elsif 
    end 
  end

end

class Player
  def move
    put "What is your move? (r, p, or s)"
    move = gets.chomp
  end

end

class Computer < Player
  def move
    ['r', 'p', 's'].sample
  end
end

