class Player

  CHOICES = ['rock', 'paper', 'scissors']

  attr_accessor :choice

  def initialize
    @choice = nil
  end

  def get_choice
    puts "What is your choice"
    @choice = gets.chomp
  end

  def get_random_choice
    @choice=CHOICES.sample
  end

end

class Game

  def initialize
    @players = 0
  end

  def compare_choices(choice1, choice2)
    return 'No one!' if choice1 == 'rock' && choice2 == 'rock'
    return 'Player Two!' if choice1 == 'rock' && choice2 == 'paper'
    return 'Player One!' if choice1 == 'rock' && choice2 == 'scissors'
    return 'No one!' if choice1 == 'scissors' && choice2 == 'scissors'
    return 'Player One!' if choice1 == 'scissors' && choice2 == 'paper'
    return 'Player Two!' if choice1 == 'scissors' && choice2 == 'rock'
    return 'No one!' if choice1 == 'paper' && choice2 == 'paper'
    return 'Player One!' if choice1 == 'paper' && choice2 == 'rock'
    return 'Player Two!' if choice1 == 'paper' && choice2 == 'scissors'
  end



  def play

    puts "Welcome to rock paper scissors"
    puts "How many people will be playing today?"
    @players = gets.chomp.to_i
    player1 = Player.new
    player1.get_choice
    if @players == 1
      player2 = Player.new
      player2.get_random_choice
      puts "computer chose #{player2.choice}"
    else
      player2 = Player.new
      player2.get_choice
    end

    winner = compare_choices(player1.choice, player2.choice)

    winner = 'Computer' if @players == 1 && winner == 'Player Two!'



    puts "#{winner} wins"

  end

end

Game.new.play
