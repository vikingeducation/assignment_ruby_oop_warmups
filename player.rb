class Player

  def initialize()
  end

  def numify(player_move)
    if player_move == "rock"
      num = 1
    elsif player_move == "scissors"
      num = 2
    elsif player_move == "paper"
      num = 3
    end
  end

  def get_move
    puts "what is your first move? select rock, paper or scissors (write in all lower-case)"
    player_move = gets.chomp
    while player_move != "rock" && player_move != "scissors" && player_move != "paper"
      puts "what is your first move? select rock, paper or scissors (write in all lower-case)"
      player_move = gets.chomp
    end
    return numify(player_move)
  end

end
