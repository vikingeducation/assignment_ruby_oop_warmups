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
  attr_accessor :player, :choice

  def initialize
    puts "We're gonna play rock, paper, scissors."
    @player1 = Player.new
    @computer = Computer.new
  end

  def get_hand
    puts "What do you want to choose?"
    @player1.hand = gets.chomp.downcase
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
    self.check_round(@player1.hand, @computer.hand)
  end


end

game = Game.new
game.play
