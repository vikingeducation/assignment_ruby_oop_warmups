class Player
  attr_accessor :name, :move

  def initialize
    @points = 0
  end
end

class Round

  def start_round
    puts "#{player1} what is your move?"
    puts "R, P, or S for Rock, Paper, Or Scissors"
  end

  def collect_move
    player.move = gets.chomp.upcase
    valid_move?
  end

  def valid_move?
    if @move != w%(R,P,S)
      "Try again, it needs to be R, P, or S"
      collect_move
    end
  end




  #prompt for number of players

  #prompt for name(s)

  #prompt for play from player1

  #correct if necessary

  #generate comp's move

  #compare moves

  #award point in class variable

  #show totals

  #prompt for replay