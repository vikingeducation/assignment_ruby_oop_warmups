# OOP 1: Rock Paper Scissors

class RockPaperScissors
  class Player
    attr_accessor :name
    def initialize(attrs)
      @name = attrs[:name]
    end
  end

  class Handshape
    attr_accessor :name
  end

  def game(player_1, player_2)
    replay = true
    while replay == true
      handshape_1, handshape_2 = handshape(player_1, player_2)
      winner = compare(handshape_1, handshape_2)
      if winner == "draw"
      else
        result = winner
        replay = false
      end
    end
  end

  def handshape(player_1, player_2)
    puts "Enter handshape for #{player_1.name}: "
    handshape_1 = gets.chomp.to_s
    if player_2 != "computer"
      puts "Enter handshape for #{player_2.name}"
      handshape_2 = gets.chomp.to_s
    else
      random_number = rand(1..3)
      case random_number
      when 1
        handshape_2 = "rock"
      when 2
        handshape_2 = "paper"
      when 3
        handshape_2 = "scissors"
      end
    end
    result = handshape_1, handshape_2
  end

  def compare(handshape_1, handshape_2)
    p "entered compare method"
    if handshape_1 == handshape_2
      return "draw"
    end
    case handshape_1
      when "rock"
      if handshape_2 == "scissors"
        winner = handshape_1
      else
        winner = handshape_2
      end
      when "paper"
        if handshape_2 == "rock"
          winner = handshape_1
        else
          winner = handshape_2
        end
      when "scissors"
        if handshape_2 == "paper"
          winner = handshape_1
        else
          winner = handshape_2
        end
    end
    winner 
  end

end
    
# End class RockPaperScissors


# Main

# name various hand shapes

# rock = Handshape.new(:name => "rock")
# paper = Handshape.new(:name => "paper")
# scissors = Handshape.new(:name => "scissors")

# get player names and play game

puts "Enter first player: "
player_1 = gets.chomp.to_s
puts "Is game against computer? (Y/N): "
answer = gets.chomp.to_s
if answer == "Y"
  player_2 = "computer"
else
  puts "Enter second player: "
  player_2 = gets.chomp.to_s
end
player_1 = RockPaperScissors::Player.new(:name => player_1)
player_2 = RockPaperScissors::Player.new(:name => player_2)

rps = RockPaperScissors.new

# play game


winner = rps.game(player_1, player_2)

# winner = game(player_1, player_2)
puts "The winner is #{winner}"

# End




