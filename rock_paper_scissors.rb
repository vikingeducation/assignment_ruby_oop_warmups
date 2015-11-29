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
    @players_decision = nil
    @computers_decision = nil
  end

  def computers_turn
    @computers_decision = Moves[rand(3)]
  end

  def game_start
    puts "ROCK PAPER SCISSORS"
    puts "By Steven Chang"
    puts "-----------------------------------------"
    round
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

puts RockPaperScissors.new.game_start
