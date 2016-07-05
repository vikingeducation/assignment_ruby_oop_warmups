class RockPaperScissors
  OPTIONS = {
    'paper' => 'rock',
    'rock' => 'scissor',
    'scissor' => 'paper'
  }
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
    player_move = @player.guess
    # binding.pry
    if OPTIONS[player_move] == @computer_move
      true
    elsif player_move == @computer_move
      puts "It's a tie, try again..."
    else
      false
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
    player_move = nil
    binding.pry
    until valid_move? player_move
      player_move = gets.chomp
    end
    player_move
  end

  def valid_move? (move)
    %w[rock paper scissor].include? move
  end
end


