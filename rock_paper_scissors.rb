=begin
  - Create a command line Rock-Paper-Scissors game, starting with one player against the computer.
  - Think through what you need beforehand and write it down.
  - What classes do you need?
  - What methods?
  - Then get started.

  - Start with one player against the computer
  - and then add 2-player mode.
=end

class RockPaperScissors

  Moves = ["r","p","s","q"]

  def initialize
    @player1 = Player.new
    @player2 = Player.new
    @computer = Computer.new
    @@mode = nil
  end

  def game_start
    puts "ROCK PAPER SCISSORS"
    puts "By Steven Chang"
    puts "-------------------------------------"
    mode
  end

  def mode
    until @@mode == '1' || @@mode == '2'
      print "ONE or TWO player mode? (Type '1' or '2' and enter): "
      @@mode = gets.chomp
    end

    one_player_mode if @@mode == '1'
    two_player_mode if @@mode == '2'
  end

  def one_player_mode
    until @player1.decision == 'q'
      puts "Your Turn!"
      @player1.players_turn
      @computer.computers_turn
      if @player1.decision == @computer.decision
        puts "it's a draw"
      elsif @player1.decision == 'r'
        if @computer.decision == 's'
          puts "You Win!"
        else
          puts "You Lose"
        end
      elsif @player1.decision == 's'
        if @computer.decision == 'r'
          puts "You Lose"
        else
          puts "You Win!"
        end
      elsif @player1.decision == 'p'
        if @computer.decision == 'r'
          puts "You Win!"
        else
          puts "You Lose!"
        end
      end
    end
  end

  def two_player_mode
    until @player1.decision == 'q' || @player2.decision == 'q'
      puts "Player ONE's Turn!"
      @player1.players_turn
      puts "Player TWO's Turn!"
      @player2.players_turn
      if @player1.decision == @player2.decision
        puts "it's a draw"
      elsif @player1.decision == 'r'
        if @player2.decision == 's'
          puts "Player ONE Wins!"
        else
          puts "Player TWO Wins!"
        end
      elsif @player1.decision == 's'
        if @player2.decision == 'r'
          puts "Player TWO Wins!"
        else
          puts "Player ONE Wins!"
        end
      elsif @player1.decision == 'p'
        if @player2.decision == 'r'
          puts "Player ONE Wins!"
        else
          puts "Player TWO Wins!"
        end
      end
    end
  end

end

class Player < RockPaperScissors

  attr_reader :decision

  def initialize
    @decision = nil
  end

  def players_turn
    decision = nil
    until valid_entry?(decision)
      print "Enter 'r' for rock, 'p' for paper, 's' for scissors or 'q' to quit: "
      decision = gets.chomp
    end
    @decision = decision
  end

  def valid_entry?(decision)
    if Moves.include? decision
      return true
    else
      return false
    end
  end

end

class Computer < RockPaperScissors

  attr_reader :decision

  def initialize
    @decision = nil
  end

  def computers_turn
    @decision = Moves[rand(3)]
  end

end

RockPaperScissors.new.game_start
