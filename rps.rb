#######################  ROCK PAPER SCISSORS

class Computer
  attr_accessor :hand

  def initialize
    @hand = ["scissors", "rock", "paper"].sample
  end

end


class Player

  attr_accessor :hand

  def initialize(string = nil)
    @hand = string
  end

end


class Game
  attr_accessor :player, :choice, :opponent

  def initialize
    puts "We're gonna play rock, paper, scissors."
    puts "Do you want to play another person or the computer? (person/computer)"
    @opponent = gets.chomp
    @player1 = Player.new
    if @opponent == "person"
        @player2 = Player.new
    elsif @opponent == "computer"
        @player2 = Computer.new
    end
  end

  def get_hand
    puts "What do you want to choose Player 1?"
    @player1.hand = gets.chomp.downcase
  end

  def opp_get_hand
    100.times {puts "\n"}
    puts "What do you want to choose Player 2?"
    @player2.hand = gets.chomp.downcase
  end

def check_round(choice1, choice2)
    if choice1 == "rock" && choice2 == "paper"
      puts "#{choice2} wins!"
      return true
    elsif choice1 == "paper" && choice2 == "rock"
      puts "#{choice1} wins!"
      return true
    elsif choice1 == "rock" && choice2 == "scissors"
      puts "#{choice1} wins!"
      return true
    elsif choice1 == "scissors" && choice2 == "rock"
      puts "#{choice1} wins!"
      return true
    elsif choice1 == "rock" && choice2 == "rock"
      puts "No one won :("
        return true
    elsif choice1 == "paper" && choice2 == "scissors"
      puts "#{choice2} wins!"
      return true
    elsif choice1 == "scissors" && choice2 == "paper"
      puts "#{choice1} wins!"
      return true
    elsif choice1 == "paper" && choice2 == "paper"
      puts "No one wins :("
        return true
    elsif choice1 == "scissors" && choice2 == "scissors"
      puts "No one wins :("
        return true
    end
  end

  def play
    self.get_hand
    self.opp_get_hand if @opponent == "person"
    self.check_round(@player1.hand, @player2.hand)
  end


end

game = Game.new
game.play
