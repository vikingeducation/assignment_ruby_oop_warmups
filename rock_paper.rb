class RockPaper
  @@options = {"rock" => 0, "paper"=> 1, "scissors"=> 2}

  def begin
    while true
      puts "Please enter your move (rock, paper or scissors)"
      puts "Enter quit if you wat to end the game."
      @@your_move = gets.chomp
      
      break if @@your_move == "quit"
      
      @@second_player_move = rand(3)
      
      if @@your_move == @@second_player_move 
        puts "Tie"
      end
        
      if win?
        puts "Congrats! You win."
      else
        puts "You lose!"
      end
    end
  end

  def win?
    if [-1,2].include?(@@options[@@your_move] - @@second_player_move)
        return true
    else 
        return false
    end
  end
end