class Player
    attr_reader :name, :choice
  def initialize
    puts "What is your name?"
    @name = gets.chomp
  end

  def choose
    puts "Do you choose rock, paper, or scissors? (Enter: r, p or s)"
    @choice = gets.chomp
  end
end

class Comp
  attr_reader :choice
  def initialize
  end

  def greeting(name)
    puts "Hello #{name}, I'm Conrad.  Let's play a game of Rock Paper Scissors. "
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
  def initialize
    @game = Game.new
  end

  def self.winner(player_choice, comp_choice )
    case player_choice
    when "r"
      if comp_choice == "r"
        puts "It's a tie!"
      elsif comp_choice == "p"
        puts "I win!  Better luck next time."
      else
        puts "You win!"
      end
    when "p"
      if comp_choice == "r"
        puts "You win!"
      elsif comp_choice == "p"
        puts "It's a tie!"
      else
        puts "I win!  Better luck next time."
      end
    when "s"
      if comp_choice == "r"
        puts puts "I win!  Better luck next time."
      elsif comp_choice == "p"
        puts "You win!"
      else
        puts "It's a tie!"
      end
    end
  end
end

def game_play
  player = Player.new
  comp = Comp.new
  comp.greeting(player.name)
  player.choose
  comp.choose
  Game.winner(player.choice, comp.choice)
end
game_play
