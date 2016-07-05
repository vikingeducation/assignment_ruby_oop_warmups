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

  def self.get_name
    puts "What's your name?"
    gets.chomp
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

class Game

  def initialize
  end

  def play
    assign_players
    @player_one.get_choice
    @player_two.get_choice
    determine_winner
  end

  def assign_players
    num_of_human_players = nil
    until num_of_human_players
      puts "How many human players?"
      num_of_human_players = gets.chomp.to_i
      if num_of_human_players == 1
        @player_one = Player.new(Player.get_name)
        @player_two = CompPlayer.new
      elsif num_of_human_players == 2
        @player_one = Player.new(Player.get_name)
        @player_two = Player.new(Player.get_name)
      end
    end
  end

  def determine_winner
    OPTIONS = {:rock => :scissors, :paper => :rock, :scissors => :paper}
    if OPTIONS[@player_one.status] == @player_two.status
      puts "#{@player_one.name} wins!"
    elsif OPTIONS[@player_two.status] == @player_one.status
      puts "#{@player_two.name} wins!"
    else
      puts "It was a tie!"
    end
  end
end
