class RockPaper
  @@options = ["rock", "paper", "scissors"]

  def begin
    while true
      puts "Please enter your move (rock, paper or scissors)"
      puts "Enter quit if you wat to end the game."
      @@your_move = gets.chomp
      break if @@your_move == "quit"
      @@second_player_move = @@options.shuffle[0]
      if @@your_move == @@second_player_move
        puts "Tie"
        next
      end
      if win?
        puts "Congrats! You win."
      else
        puts "You lose!"
      end
    end
  end

  def win?
    if @@your_move == "rock"
      if @@second_player_move == "paper"
        return false
      else
        return true
    elsif @@your_move == "paper"
      if @@second_player_move == "scissors"
        return false
      else
        return true
    else
      if @@second_player_move == "rock"
        return false
      else
        return true
      end
    end
  end
end