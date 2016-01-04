class RPSGame
  attr_accessor :player_index

  def initialize()
    @players = [Player.new("ai", "AI"),Player.new("human", "Josh")]
    self.player_index = [0,1].sample
  end

  def winner(player1, move1, player2, move2)
    if move1 == :rock && move2 == :scissors ||
        move1 == :scissors && move2 == :paper ||
        move1 = :paper && move2 == :rock
      return player1
    elsif move2 == :rock && move1 == :scissors ||
        move2 == :scissors && move1 == :paper ||
        move2 = :paper && move1 == :rock
      return player2
    else
      return "draw"
    end
  end

  def game_loop()
    
  end
end

class Player
  attr_accessor :type, :name

  def initialize(type,name)
    @type = type
    @name = name
  end

  def play
    [:rock,:paper,:scissors].sample
  end
end