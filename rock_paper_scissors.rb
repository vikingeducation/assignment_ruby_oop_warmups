class Game

  attr_accessor :player1, :player2, :against_computer, :opponent

  def initialize(num_players)
    @player1 = false
    @player2 = false
    if num_players == 1
      @against_computer = true
      @opponent = "Computer"
    else
      @against_computer = false
      @opponent = "Player 2"
    end
  end

  def over?
    if @player1 == true || @player2 == true
      return true
    end
  end

  def compare(player1_choice, player2_choice)
    if player1_choice == player2_choice
      puts "Draw! Choose again!"
      return
    end
    if (player1_choice == "r" && player2_choice == "s") || (player1_choice == "p" && player2_choice == "r") || (player1_choice == "s" && player2_choice == "r")
      puts "Player 1 Wins!"
      @player1 = true
    else
      puts "#{@opponent} Wins!"
      @player2 = true
    end
  end

  def make_choice
    puts "Player 1! Type ROCK (R), PAPER (P), or SCISSORS (S)"
    player1_choice = gets.chomp
    player1_choice = player1_choice[0].downcase

    if @against_computer
      player2_choice = ["r","p","s"].sample
    else
      puts "Player 2! Type ROCK (R), PAPER (P), or SCISSORS (S)"
      player2_choice = gets.chomp
      player2_choice = player2_choice[0].downcase
    end

    compare(player1_choice, player2_choice)
  end

end

puts "This is Rock-Paper-Scissors!\n1 or 2 Players?\nTYPE '1' or '2' NOW!"
players = gets.chomp
game = Game.new(players.to_i)

while !game.over?

  game.make_choice

end
