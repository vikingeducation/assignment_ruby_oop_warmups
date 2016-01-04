class RPSGame
  attr_accessor :players, :player_index, :choices

  def initialize()
    self.choices = [:rock,:paper,:scissors]
    setup()
  end

  def setup
    self.player_index = [0,1].sample
    
    print "How many players? (1 or 2): "
    num_players = gets.chomp.to_i
    self.players = [Player.new("human")]
    if num_players == 1
      self.players << Player.new("ai")
    elsif num_players == 2
      self.players << Player.new("human")
    else
      puts "Must be 1 or 2."
      setup
    end
  end

  def self.ask_name
    print "Please enter your name: "
    return gets.chomp
  end
  
  def self.ask_move(player)
    print "#{player.name} enter your move (rock,paper or scissors):"
    move = gets.chomp.to_sym
    if ![:rock,:paper,:scissors].include?(move)
      self.ask_move(player)
    else
      return move
    end
  end

  def self.message(str)
    puts str
  end

  def winner(player1, move1, player2, move2)
    if move1 == :rock && move2 == :scissors ||
        move1 == :scissors && move2 == :paper ||
        move1 == :paper && move2 == :rock
      result = "The winner is: #{player1.name}"
    elsif move2 == :rock && move1 == :scissors ||
        move2 == :scissors && move1 == :paper ||
        move2 == :paper && move1 == :rock
      result = "The winner is: #{player2.name}"
    else
      result = "The game ends in a draw"
    end

    return result
  end

  def game_loop()
     player1 = @players[player_index]
     move1 = player1.play
     
     switch_player
     
     player2 = @players[player_index]
     move2 = player2.play

     puts winner(player1,move1,player2,move2)

     print "Do you want to play again? (y or n): "
     answer = gets.chomp
    if answer == "y"
      setup()
      game_loop
    end
  end

  def switch_player
      player_index == 0? (self.player_index = 1):(self.player_index = 0)
  end
end

class Player
  attr_accessor :type, :name
  
  def initialize(type)
    @type = type

    if type == "ai"
      @name = "AI"
    else
      @name = RPSGame.ask_name
    end
  end

  def play
    if type == "ai"
      move = [:rock,:paper,:scissors].sample
      RPSGame.message("Computer has selected its move: #{move}")
    else 
      move = RPSGame.ask_move(self)
    end
    move   
  end
end

game = RPSGame.new()
game.game_loop