class Game
  attr_accessor :scissor, :stone, :paper, :player

  def initialize
    @scissor = false
    @stone  = false
    @paper = false
    @player
  end

  def scissor
    puts "computer puts scissor"
    @scissor = true
  end

  def stone
    puts "computer puts stone"
    @stone = true
  end

  def paper
    puts "computer puts paper"
    @paper = true
  end

  def computer_play
    result = rand(1..3)
    case result
    when 1
      scissor
    when 2
      stone
    else
      paper
    end
  end

  def player_input
    puts "Input 1 for scissor, 2 for stone, 3 for paper"

    @player=gets.chomp.to_i

    if @player == 1
      puts "you put scissor\n"
    elsif @player == 2
      puts "you puts stone\n"
    else
      puts "you puts paper\n"
    end


  end



  def play
    if @player == 1 && @paper == true

      win?
    elsif @player == 2 && @scissor == true

      win?
    elsif @player == 3 && @stone == true

      win?
    else
      puts "you didn't win"
    end
  end


  def win?
    puts "you win!"
    exit
  end


end


puts "Welcome to the stone,paper, scissor game "
game = Game.new()
game.player_input
game.computer_play
game.play
