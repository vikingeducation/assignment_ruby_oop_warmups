# RPS class
#   initialize (players or computer)
#   play until win
#   win condition
  # player class
  # computer class


class RPS

  def initialize
    @player = Player.new("Player 1")
    puts "how many players? (1 or 2)"
    num = gets.chomp.to_i
    @player2 = Computer.new("Comp") if num == 1
    @player2 = Player.new("Player 2") if num == 2
    play
  end

  def play
    puts "player 1:"
    @player_move = @player.move("Player 1")
    @player2_move = @player2.move("Player 2")
    until win?
      play
    end
  end

  def win?
    if @player_move != @player2_move
      puts who_won + " won!"
      return true
    end
    false
  end

  def who_won
    players = [@player.name, @player2.name]
    moves = [@player_move, @player2_move]

    if moves.include?("r") && moves.include?("p")
      i = moves.index("p")
      return players[i]
    elsif moves.include?("r") && moves.include?("s")
      i = moves.index("r")
      return players[i]
    elsif moves.include?("s") && moves.include?("p")
      i = moves.index("s")
      return players[i]
    end
  end

end

class Player
  attr_reader :name
  def initialize(name)
    @name = name
  end

  def move(str)
    puts str + ", what is your move? (r, p, or s)"
    move = gets.chomp
  end
end

class Computer < Player
  def move(str)
    move = ['r', 'p', 's'].sample
    puts move
    move
  end
end

