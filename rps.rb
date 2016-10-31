# game class
class Game
end
  # check whether a player beat another player

# (eventually 2) players
class Player


  def initialize(human=false)
    @human = human
    CHOICES = ["r", "p", "s"]
  end

  def choice
    puts "Enter 'r', 'p', or 's' to make your choice:"
    @input = @human ? gets.chomp.downcase : CHOICES.sample
    choice unless is_valid?(@input)
    @input
  end

  def is_valid?(input)
    CHOICES.include?(@input)
  end
end
  # players make moves

# hash
  # rock
  # paper
  # scissors