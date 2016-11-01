class Game

  MOVES = { 'r' => 's', 's' => 'p', 'p' => 'r' }
  COMPUTER_MOVES = MOVES.keys
  def initialize(game_type)
    if game_type == 'c'
      # set up for computer
      @game_type = :vs_computer
    else
      #set up for human
      @game_type = :vs_human
    end
  end

  def play
    loop do
      take_turn
    end
  end

  def take_turn
    print "Enter the first letter of your move: [r]ock, [p]aper, [s]cissors or type 'quit' \n >> "
    player_move = gets.chomp
    quit?(player_move)
    computer_move = COMPUTER_MOVES[rand(0..2)]
    puts "Computer move: #{computer_move}"
    winner = evaluate_winner(player_move,computer_move)
    results(winner)
  end

  def results(winner)
    puts "You win!" if winner == 1
    puts "Tie" if winner == 0
    puts "You lose" if winner == -1
    puts "Invalid move" if winner == -2
  end

  def quit?(player_move)
    exit if player_move == 'quit'
  end

  def evaluate_winner(move_1,move_2)
    return 1 if MOVES[move_1] == move_2
    return -1 if MOVES[move_2] == move_1
    return 0
  end

end

puts "Rock paper scissors game"
print "Enter 'h' to play vs. human, or 'c' to play vs. computer \n >> "
game_type = gets.chomp

game = Game.new(game_type)
game.play
