

# Game State

#   Player 1 move


#   player 2 move

# Player

#   Get move

#   -> Human

#     Type in command

#     send to game state

#   -> Computer

#     RNG


require 'io/console'

class GameState

  def initialize(opponent = 'computer')

    @player1 = Human.new

    if opponent == 'computer'
      @player2 = Computer.new
    else
      @player2 = Human.new
    end

  end

  def start_game
    puts "Input 'R' for Rock, 'P' for Paper, or 'S' for Scissors"
  end

  def get_moves

    words = {"S" => "Scissors", "R" => "Rock", "P" => "Paper"}

    puts "Player 1: Enter Move"
    p1 = @player1.move

    puts "Player 2: Enter Move" if @player2.is_a? Human
    p2 = @player2.move

    puts "Player 1 played #{words[p1]} and Player 2 played #{words[p2]}"

    return [p1, p2]

  end

  def p1_plays_s(p2_move)
      if p2_move == 'P'
        return 1
      elsif p2_move == 'R'
        return 2
      end
  end

  def p1_plays_r(p2_move)
      if p2_move == 'S'
        return 1
      elsif p2_move == 'P'
        return 2
      end
  end

  def p1_plays_p(p2_move)
      if p2_move == 'R'
        return 1
      elsif p2_move == 'S'
        return 2
      end
  end

  def determine_winner(arr)

    p1_move = arr[0]
    p2_move = arr[1]

    return 0 if p1_move == p2_move

    if p1_move == 'S'
      p1_plays_s(p2_move)

    elsif p1_move == 'R'
      p1_plays_r(p2_move)

    elsif p1_move == 'P'
      p1_plays_p(p2_move)
    end

  end

  def print_result(winner)
    if winner == 0
      puts "The game is a tie!"
    else
      puts "The winner is Player #{winner}"
    end
  end

  def quit?
    puts "Play again? Type 'Y' to play again. Type anything else to quit."
    selection = gets.chomp.upcase
    selection == "Y" ? false : true
  end

  def play

    start_game

    while true
      current_moves = get_moves
      winner = determine_winner(current_moves)
      print_result(winner)

      break if quit?
    end

    puts "Thanks for playing!"
  end

end


class Player

  def move
    pass
  end

end


class Human < Player

  def move
    selection = ""

    # Don't let the player put in bad moves
    until ["S","P","R"].include?(selection)
      selection = STDIN.noecho(&:gets).chomp.upcase
      unless ["S","P","R"].include?(selection)
        puts "Invalid choice, please try again:"
      end
    end

    return selection
  end

end

class Computer < Player

  def move
    comp_move = ["Scissors","Paper","Rock"].sample
    # puts "The computer plays #{comp_move}!"
    comp_move = comp_move[0]
    return comp_move
  end

end

#game = GameState.new

game = GameState.new("Human")

game.play




