class RockPaperScissors

  def intialize

    @player1 = new.Player
    @player2 = new.Computer

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

  attr_accesor :choice

  def choose
    puts "Choose between rock, paper or scissors"
    @choice = gets.chomp.downcase
    
    if !validate(@choice)
      puts "Invalid input"
      choose
    end

  end

  def validate (entry)
    @options = ["rock", "paper", "scissors"]
    
    if options.include?(entry)
      return true
    end

    return   false

  end

end


class Computer < Player

  def choose
    
    @choice = @options[rand(1..3)]

  end

end