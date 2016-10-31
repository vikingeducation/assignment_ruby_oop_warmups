# game class
class Game

  def initialize

  end

  # check choices agaist each other

  # player interactions
  def play
    # get player choices
    @player.choice
  end

end

# (eventually 2) players
class Player

  CHOICES = ["r", "p", "s"]


  def initialize(human=false)
    @human = human
  end

  # players make moves
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



# player
  # players make moves
  # helper: valid?

# game
  # constant comparison hash
    # rock
    # paper
    # scissors
  # initialize players
    # new instance of each
      # human or computer
  # play
    # getting player input <--> game calls player.choice 
  # helper: check against hash
  # helper: render