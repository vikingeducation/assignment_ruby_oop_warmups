class RockPaper
  @@options = {"rock" => 0, "paper"=> 1, "scissors"=> 2}
  @@options_arr = ["rock", "paper", "scissors"]

  def begin
    while true
      puts "Do you want to play with computer or another player? (c for computer, p for human player)?"
      play_with = gets.chomp
      
      #play with computer or not here
      if play_with == "c"
        play_vs_computer
      else
        play_vs_human
      end

      puts "Please enter your move (rock, paper or scissors)"
      puts "Enter quit if you wat to end the game."
      @@your_move = gets.chomp

      unless ["rock", "paper", "scissors", "quit"].include?(@@your_move)
        puts "Your input is not valid"
        next
      end
      
      break if @@your_move == "quit"
            
      puts "The other player plays #{@@options_arr[@@second_player_move]}"

      if @@your_move == @@options_arr[@@second_player_move]
        puts "Tie"
      elsif win?
        puts "Congrats! You win."
      else
        puts "You lose!"
      end
    end
  end

  def play_vs_computer
    @@second_player_move = rand(3)
  end

  def play_vs_human
    puts "Player two, please enter your move"
    @@second_player_move = @@options[gets.chomp]
  end

  def win?
    if [1,-2].include?(@@options[@@your_move] - @@second_player_move)
        return true
    else 
        return false
    end
  end
end