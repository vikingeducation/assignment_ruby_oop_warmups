
class Player
attr_accessor :choice

  def initialize(choice)
    @choice = choice
  end

  def get_choice
    puts "What is your choice"
    player_choice = gets.chomp
    
  end

end

class Game

  def play
    choices_array = ['rock', 'paper', 'scissors']

    puts "Welcome to rock paper scissors"
    puts "How many people will be playing today?"
    num_players = gets.chomp.to_i
    puts "What is your choice"

    choice = gets.chomp

    player1 = Player.new(choice)
    if num_players == 1
      player2 = Player.new(choices_array.sample)
      puts "computer chose #{player2.choice}"
    else
      puts "What is your choice player two?"
      choice = gets.chomp
      player2 = Player.new(choice)
    end


    winner = 'No one!' if player1.choice == 'rock' && player2.choice == 'rock'
    winner = 'Player Two!' if player1.choice == 'rock' && player2.choice == 'paper'
    winner = 'Player One!' if player1.choice == 'rock' && player2.choice == 'scissors'
    winner = 'No one!' if player1.choice == 'scissors' && player2.choice == 'scissors'
    winner = 'Player One!' if player1.choice == 'scissors' && player2.choice == 'paper'
    winner = 'Player Two!' if player1.choice == 'scissors' && player2.choice == 'rock'
    winner = 'No one!' if player1.choice == 'paper' && player2.choice == 'paper'
    winner = 'Player One!' if player1.choice == 'paper' && player2.choice == 'rock'
    winner = 'Player Two!' if player1.choice == 'paper' && player2.choice == 'scissors'

    puts "#{winner} wins"

  end

end
