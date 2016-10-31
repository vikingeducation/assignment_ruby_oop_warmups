class Game
  def play
    puts "Rock paper scissors game"
    puts "Type 'quit' to quit."
    while true
      take_turn
    end
  end

  def take_turn
    moves = ["rock","paper","scissors"]
    print "Enter your move: rock, paper or scissors \n >> "
    player_move = gets.chomp
    quit?(player_move)
    computer_move = moves[rand(0..2)]
    puts "Computer move: #{computer_move}"
    winner = evaluate_winner(player_move,computer_move)
    results(winner)
  end

  def results(winner)
    puts "You win!" if winner == 1
    puts "Tie" if winner == 0
    puts "You lose" if winner == -1
  end

  def quit?(player_move)
    exit if player_move == 'quit'
  end

  def evaluate_winner(move_1,move_2)
    case move_1
    when "rock"
      return 1 if move_2 == "scissors"
      return 0 if move_2 == "rock"
      return -1 if move_2 == "paper"
    when "scissors"
      return 1 if move_2 == "paper"
      return 0 if move_2 == "scissors"
      return -1 if move_2 == "rock"
    when "paper"
      return 1 if move_2 == "rock"
      return 0 if move_2 == "paper"
      return -1 if move_2 == "scissors"
    end
  end

end

game = Game.new
game.play
