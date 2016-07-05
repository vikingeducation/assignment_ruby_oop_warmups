class RockPaperScissors

  def initialize
    @player = Player.new
    @computer = ComputerPlayer.new
    @computer_move = ""
  end
  #play
  def play

    puts "Welcome to RPC"
    puts "Player move..."
    win_flag = player_win?
    while win_flag.nil?
      if win_flag
        puts "Great job you win"
      else
        puts "You suck, computer wins with #{@computer_move}..."
      end
    end
  end


  #evaluate
  def player_win?
    @computer_move = @computer.guess
    case @player.guess
      when 'rock'
        return true if @computer_move == "scissor"
        return false if @computer_move == "paper"
      when 'paper'
        return true if @computer_move == "rock"
        return false if @computer_move == "scissor"
      when 'scissor'
        return true if @computer_move == "paper"
        return false if @computer_move == "rock"
      else
        puts "wrong move, try again..."
      end
  end

end


class ComputerPlayer
  #guess
  def guess
    computer_move = %w[rock, paper, scissor].sample
    # puts "The computer chose #{computer_move}"
    computer_move
  end
end

class Player
  #guess
  def guess
    puts "Enter your play"
    player_move = gets.chomp
  end
end

# game1 = RockPaperScissors.new
# game1.play
