class RPSGame
  attr_accessor :player_index

  def initialize()
    @players = [Player.new("ai", "AI"),Player.new("human", "Josh")]
    self.player_index = [0,1].sample
  end

  def winner(player1, move1, player2, move2)
    if move1 == :rock && move2 == :scissors ||
        move1 == :scissors && move2 == :paper ||
        move1 == :paper && move2 == :rock
      return player1
    elsif move2 == :rock && move1 == :scissors ||
        move2 == :scissors && move1 == :paper ||
        move2 == :paper && move1 == :rock
      return player2
    else
      return "draw"
    end
  end

  def game_loop()
       player1 = @players[player_index]
       move1 = player1.play
       
       switch_player
       
       player2 = @players[player_index]
       move2 = player2.play

       puts winner(player1,move1,player2,move2)
       
  end

  def switch_player
      player_index == 0? (self.player_index = 1):(self.player_index = 0)
  end
    
end

class Player
  attr_accessor :type, :name
  
  def initialize(type,name)
    @type = type
    @name = name
  end

  def play
    choices =  [:rock,:paper,:scissors]
    if @type == "ai"
       move = choices.sample
       puts "Computer has selected its move: #{move}"
    else 

       puts "Enter your move (rock,paper or scissors):"
       move = gets.chomp.to_sym
       if !choices.include?(move)
          self.play
       end
    end
    move   
  end
end

game = RPSGame.new
game.game_loop