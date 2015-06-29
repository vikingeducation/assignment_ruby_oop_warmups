

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




class GameState

  def initialize(oppenent = 'computer')

    @player1 = Human.new

    @player2 = Computer.new

  end

  def start_game

    puts "Input 'R' for Rock, 'P' for Paper, or 'S' for Scissors"

  end




  def get_moves

    puts "Player 1: Enter Move"

    p1 = @player1.move

    puts "Player 2: Enter Move"

    p2 = @player2.move

    return [p1, p2]

  end

  def determine_winner(arr)

    p1_move = arr[0]

    p2_move = arr[1]

    if p1_move == p2_move

      return 0

    end

    if p1_move == 'S'

      if p2_move == 'P'

        return 1

      elsif p2_move == 'R'
        
        return 2

      end

    elsif p1_move == 'R'

      if p2_move == 'S'

        return 1

      elsif p2_move == 'P'

        return 2

      end

    elsif p1_move == 'P'

      if p2_move == 'R'

        return 1

      elsif p2_move == 'S'

        return 2

      end

    end 

  end

  def play

    start_game

    while true

      current_moves = get_moves

      winner = determine_winner(current_moves) 

      puts "The winner is Player #{winner}"

      break

    end

  end

end




class Player


  def move

    pass

  end


end


class Human << Player 

  def move

    selection = ""

    until ["S","P","R"].include?(selection)

      selection = gets.chomp.upcase

    end 

    return selection

  end

end












