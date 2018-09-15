
class Player
  attr_accessor :name, :choice

  def initialize
  end

  def choose(name)
    puts "#{@name}, do you choose rock, paper, or scissors? (Enter: r, p or s)"
    @choice = gets.chomp
  end
end

class Comp
  attr_reader :choice, :name
  def initialize
    @name = "Conrad"
  end

  def greeting1(name1)
    puts "Hello #{name1}, I'm #{@name}.  Let's play a game of Rock Paper Scissors. "
  end

  def choose
    num_choice = rand(1..3)
    if num_choice ==1
      puts "I chose Rock."
      @choice =  "r"
    elsif num_choice ==2
      puts "I chose Paper."
      @choice =  "p"
    else
      puts "I chose Scissors."
      @choice =  "s"
    end
  end
end

class Game
  def initialize(num_players)
    player_1 = Player.new
    puts "What is Player 1's name?"
    player_1.name = gets.chomp
    if num_players == 2
      player_2 = Player.new
      puts "What is Player 2's name?"
      player_2.name = gets.chomp
    else
      player_2 = Comp.new
    end
    game_play(player_1, player_2)
  end

  def game_play(player_1, player_2)
    player_1.choice = player_1.choose(player_1.name)
    player_2.choice = player_2.choose(player_2.name)
    Game.winner(player_1, player_2)
  end


  def self.winner(player_1, player_2 )
    case player_1.choice
      when "r"
        if player_2.choice == "r"
          puts "It's a tie!"
        elsif player_2.choice == "p"
          puts "#{player_2.name} wins!"
        else
          puts "#{player_1.name} wins!"
        end
      when "p"
        if player_2.choice == "r"
          puts "#{player_1.name} wins!"
        elsif player_2.choice == "p"
          puts "It's a tie!"
        else
          puts "#{player_2.name} wins!"
        end
      when "s"
        if player_2.choice == "r"
          puts puts "#{player_2.name} wins!"
        elsif player_2.choice == "p"
          puts "#{player_1.name} wins!"
        else
          puts "It's a tie!"
        end
    end
  end
end



Game.new(2)
