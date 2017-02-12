# ----------------------------------------------------------------
# ROCK PAPER SCISSORS
# ----------------------------------------------------------------

# get the player's move
# get the ai's move
# compare and decide the winner

class RockPaperScissors

  attr_accessor :moves

  def initialize
    @moves = {1 => "rock", 2 => "paper", 3 => "scissors"}
  end

  def rock_rules m2
    if m2 == 2
      puts "Lose"
    else
      puts "Win"
    end
  end

  def paper_rules m2
    if m2 == 1
      puts "Win"
    else
      puts "Lose"
    end
  end

  def scissors_rules m2
    if m2 == 1
      puts "Lose"
    else
      puts "Win"
    end
  end

  def winner m1, m2
    if m1 == m2
      puts "Draw"
    elsif m1 == 1
      rock_rules(m2)
    elsif m1 == 2
      paper_rules(m2)
    else
      scissors_rules(m2)
    end
  end

  def make_move
    rand(1..3)
  end

  def translate_move move
    self.moves[move]
  end

  def play
    puts "enter your move:"
    puts "1: rock; 2: paper; 3: scissors"
    while true
      print "> "
      player_move = gets.chomp.to_i
      ai_move = self.make_move
      {"player": player_move, "other player": ai_move}.map do |player, move|
        puts "#{player} move: #{self.translate_move(move)}"
      end
      self.winner(player_move, ai_move)
    end
  end

end

rps = RockPaperScissors.new
rps.play
