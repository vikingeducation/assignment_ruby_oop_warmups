class Rps

  def initialize(players)

    @player1 = Player.new

    if players == 1
      @player2 = Computer.new
    elsif players == 2
      @player2 = Player.new
    end

  end

  def play

    p "Let's play Rock Paper Scissors!"
    p "To quit, enter 'q'"

    while true
      @player1.choose
      puts "Player 1 chose #{@player1.choice}"
      @player2.choose
      puts "Player 2 chose #{@player2.choice}"
      compare
    end

  end

  def compare

    if @player1.choice == @player2.choice
      puts "Tie. Try Again"

    elsif @player1.choice == "rock"
      if @player2.choice == "paper"
        outcome(2)
      else
        outcome(1)
      end

    elsif @player1.choice == "paper"
      if @player2.choice == "scissors"
        outcome(2)
      else
        outcome(1)
      end

    elsif @player1.choice == "scissors"
      if @player2.choice == "rock"
        outcome(2)
      else
        outcome(1)
      end

    end

  end

  def outcome(str)
    if str == 2
      puts "Player 2 won"
    else
      puts "Player 1 won"
    end
  end

end


class Player

  attr_accessor :choice

  def initialize

    @options = ["rock", "paper", "scissors"]

  end

  def choose

    puts "Choose between rock, paper or scissors"
    @choice = gets.chomp.downcase

    exit if choice == 'q'
    
    if !validate(@choice)
      puts "Invalid input"
      self.choose
    end

  end

  def validate (entry)
    
    @options.include?(entry)

  end

end


class Computer < Player

  def choose
    
    @choice = @options.sample

  end

end

puts "How many players?"
game = Rps.new(gets.chomp.to_i)
game.play