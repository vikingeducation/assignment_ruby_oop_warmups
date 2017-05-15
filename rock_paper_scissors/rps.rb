class RockPaperScissors

  def initialize(single_player = true)
    @single_player = single_player
    other_player = single_player ? AIPlayer.new("AI player") : Player.new("Player 2") 
    @players = [Player.new("Player 1"), other_player]
  end

  def play
    loop do
      quit_game = false
      moves = {}
      for player in @players
        loop do
          move = player.pick_move
          quit_game = (move == 'quit')
          if valid_move?(move)
            moves[player.name] = move
            break
          end
        end
        break if quit_game
      end
      break if quit_game

      show_moves(moves)
      show_winner(moves)

      break if not play_again?
    end
  end

  def valid_move?(move)
    return ((move ==     'rock') or 
            (move ==    'paper') or 
            (move == 'scissors') or 
            (move ==     'quit'))
  end

  def play_again?
    answer = 'y'
    loop do
      print "Play again (y/n)? "
      answer = gets.chomp.downcase

      break if answer == 'y' or answer == 'n'
    end
    return (answer != 'n')
  end

  def show_moves(moves)
    for name, move in moves
      puts name + " played " + move
    end
  end

  def show_winner(moves)
    move_array = moves.to_a
    if tie?(move_array)
      puts "Tie! Everybody loses!"
    else
      winner_name = get_winner(move_array)
      puts winner_name + " wins!"
    end
  end

  def tie?(move_array)
    return move_array[0][1] == move_array[1][1]
  end

  def get_winner(move_array)
    p1_move, p2_move = move_array[0][1], move_array[1][1]
    winner = move_array[1]
    if won?(p1_move, p2_move)
      winner = move_array[0]
    end
    return winner[0]
  end

  def won?(p1_move, p2_move)
    won = false
    if p1_move == 'rock'
      won = true if p2_move == 'scissors'
    elsif p1_move == 'paper'
      won = true if p2_move == 'rock'
    elsif p1_move == 'scissors'
      won = true if p2_move == 'paper'
    end
    return won
  end
end

class Player

  attr_reader :name

  def initialize(name)
    @name = name
  end

  def pick_move
    print @name + ", enter move (rock, paper, scissors, quit) > "
    return gets.strip.downcase
  end
end

class AIPlayer < Player
  def pick_move
    ['rock', 'paper', 'scissors'].sample
  end
end

puts "Welcome to rock, paper, scissors!"

answer = 'y'
loop do
  print "Start in single-player mode (y/n)? "
  answer = gets.strip

  break if answer == 'y' or answer == 'n'
end

single_player = (answer != 'n')

rps = RockPaperScissors.new(single_player)
rps.play
