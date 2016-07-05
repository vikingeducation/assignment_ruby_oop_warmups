class RockPaperScissors

  def initialize
    @player = Player.new
    @computer = ComputerPlayer.new
    @computer_move = ""
  end
  
  def play

    puts "Welcome to RPC"
    puts "Player move..."
    win_flag = nil
    while win_flag.nil?
      win_flag = player_win?
      if win_flag 
        puts "Great job you win, computer guessed #{@computer_move}"
      elsif win_flag == false
        puts "You suck, computer wins with #{@computer_move}..."
      else
        puts "Guess again, either rock, paper, or scissor"
      end
    end
  end


  
  def player_win?
    @computer_move = @computer.guess
    
    case @player.guess

      when 'scissor'
        return true if @computer_move == "paper"
        return false if @computer_move == "rock"
      when 'rock'
        return true if @computer_move == "scissor"
        return false if @computer_move == "paper"
      when 'paper'
        return true if @computer_move == "rock"
        return false if @computer_move == "scissor"
      
      else
        puts "wrong move, try again..."
      end
  end

end


class ComputerPlayer
  
  def guess
    computer_move = %w[rock paper scissor].sample
    
    computer_move
  end
end

class Player
  
  def guess
    puts "Enter your play"

    until valid_move?
      player_move = gets.chomp
    end

  end

  def valid_move?

  end
end


