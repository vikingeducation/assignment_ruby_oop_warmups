# Player class
# Computer Player inherits from Player
# Game Class



class Player
  attr_reader :status, :name
  def initialize(name = "mister_no_name")
    @name = name
    @status = nil
  end

  def throw(choice)
    @status = choice
  end

  def gather_choice
    puts "Enter your choice"
    choice = gets.strip
    case choice
    when "rock"
      throw(:rock)
    when "paper"
      throw(:paper)
    when "scissors"
      throw(:scissors)
    else
      puts "Incorrect input"
      gather_choice
    end
  end

end

class CompPlayer < Player

  def initialize
    super("computer")
  end

  def gather_choice
    choices = [:rock, :paper, :scissors]
    throw(choices[rand(3)])
  end
end

class RPS

  def initialize
  end

  def play
    assign_players
  end

  def assign_players
    puts "How many human players?"
    num_of_human_players = gets.chomp.to_i
    if num_of_human_players == 1
      puts 
    end
  end
end
