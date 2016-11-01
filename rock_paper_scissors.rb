class Player
  attr_accessor :move

  def initialize
    @points = 0
    @move = "a"
  end
end

class Round

  def initialize
    start_round
    collect_move
    winner.points += 1
    puts "#{@winner} was the winner!"
    puts "Player one has #{@player_one.points} and player two has #{@player_two.points!}"
  end

  def start_round
    puts "Player one what is your move?"
    puts "R, P, or S for Rock, Paper, Or Scissors"
  end

  def collect_move
    @player_one.move = gets.chomp.upcase
    valid_move?
    if @num_players == 1
      @player_two.move = MOVE_OPTIONS.to_a.sample[0]
    else
      puts "Player one what is your move?"
      puts "R, P, or S for Rock, Paper, Or Scissors"
      @player_two.move = gets.chomp.upcase
      valid_move?
    end
  end

  def valid_move?
    if @move_options.include? move
      "Try again, it needs to be R, P, or S"
      collect_move
    end
  end

  def winner
    if MOVE_OPTIONS[@player_one.value] == @player_two.key
      @player_two
    elsif MOVE_OPTIONS[@player_two.value] == @player_one.value
      @player_one
    end
  end

end

class Game
  attr_reader :player_one,
              :player_two

  MOVE_OPTIONS = {:r => "p",
                  :p => "s",
                  :s => "r"
  }

  def initialize
    puts "How many people will be playing? (1 or 2)"
    @num_players = gets.chomp.to_i
    set_players
    Round.new
  end

  def set_players
    @player_one = Player.new
    @player_two = Player.new # condition for computer
  end

end

Game.new



  #prompt for number of players

  #prompt for name(s)

  #prompt for play from player1

  #correct if necessary

  #generate comp's move

  #compare moves

  #award point in class variable

  #show totals

  #prompt for replay