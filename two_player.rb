
class RockPaperScissors

  class Player
    def initialize
      @players_decision = nil
    end

    def players_turn
    decision = nil
    puts "Your Turn"
    until valid_entry?(decision)
      print "Enter 'r' for rock, 'p' for paper, 's' for scissors or 'q' to quit: "
      decision = gets.chomp
    end
    @players_decision = decision
  end

  def round
    until @players_decision == 'q'
      players_turn
      computers_turn
      if @players_decision == @computers_decision
        puts "it's a draw"
      elsif @players_decision == 'r'
        if @computers_decision == 's'
          puts "You Win!"
        else
          puts "You lose"
        end
      elsif @players_decision == 's'
        if @computers_decision == 'r'
          puts "You lose"
        else
          puts "You Win!"
        end
      elsif @players_decision == 'p'
        if @computers_decision == 'r'
          puts "You Win!"
        else
          puts "You Lose!"
        end
      end
      round
    end
  end

  def valid_entry?(decision)
    if Moves.include? decision
      return true
    else
      return false
    end
  end
  end

  Moves = ["r","p","s","q"]

  def initialize
    player2 = Player.new
    @computers_decision = nil
    @play_mode = nil
  end

  def computers_turn
    @computers_decision = Moves[rand(3)]
  end

  def game_start
    puts "ROCK PAPER SCISSORS"
    puts "By Steven Chang"
    puts "-------------------------------------"
    play_mode
    if @play_mode == '1'
      player1 = Player.new
      player1.round
    else
      puts "PLAY AGAINST A FRIEND!"
    end
  end

  def play_mode
    until @play_mode == "1" || @play_mode == "2"
      print "Enter '1' to play against the computer or '2' to play against a friend: "
      @play_mode = gets.chomp
    end
  end

end

RockPaperScissors.new.game_start
