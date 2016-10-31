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
    # r
    # paper
    # scissors
  # initialize players
    # new instance of each
      # human or computer
  # play
    # getting player input <--> game calls player.choice 
    # check winner
  # helper: check winner, if inputs are same, return nil, continue while loop
  # helper: render

# game class
class Game
  COMPARISONS = {:r => :s, :s => :p, :p => :r}

  def initialize(player1, player2)
    @winner = nil
    @player1 = player1
    @player2 = player2
  end

  # player interactions
  def play
    while !@winner
      # get player choices
      @human_input = @player1.choice
      @computer_input = @player2.choice

      # check for winner
      @winner = check_winner(human_input, computer_input)

      # render
      render(@winner)
    end
  end

  def check_winner(human_input, computer_input)
    return :human if COMPARISONS[human_input] == computer_input
    return :computer if COMPARISONS[computer_input] == human_input
    nil
  end

  def render(winner)
    puts "You chose #{@human_input}."
    puts "The computer chose #{@computer_input}."
    if winner
      puts "The winner is #{winner}."
    else
      puts "No winner yet!"
    end
  end

end

Game.new(Player.new(human: true), Player.new)