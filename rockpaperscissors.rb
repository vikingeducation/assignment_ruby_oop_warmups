class RockPaperScissors
  OPTIONS = {
    'paper' => 'rock',
    'rock' => 'scissor',
    'scissor' => 'paper'
  }
  def initialize
    @player = Player.new
    @computer = ComputerPlayer.new
    
  end

  def play

    puts "Welcome to RPC"
    puts "Player move..."
    win_flag = nil
    while win_flag.nil?
      win_flag = player_win?
      if win_flag
        puts "Great job you win, computer guessed #{@computer.current_move}"
      elsif win_flag == false
        puts "You suck, computer wins with #{@computer.current_move}..."
      else
        puts "Guess again, either rock, paper, or scissor"
      end
    end
    @player.current_move = nil

  end



  def player_win?
    @computer.guess
    
    @player.guess
    if OPTIONS[@player.current_move] == @computer.current_move
      true
    elsif @player.current_move == @computer.current_move
      puts "It's a tie, try again..."
    else
      false
    end
  end

end


class ComputerPlayer
  attr_reader :current_move
  def initialize
    @current_move = nil
  end
  
  def guess
    @current_move = %w[rock paper scissor].sample
  end
end

class Player
  attr_accessor :current_move
  def initialize
    @current_move = nil
  end

  def guess
    puts "Enter your play"
    move = nil
    until valid_move? move
      move = gets.chomp
    end
    @current_move = move
  
  end

  def valid_move? (move)
    %w[rock paper scissor].include? move
  end
end


