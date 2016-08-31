class RockPaper
  @@options = {"rock" => 0, "paper"=> 1, "scissors"=> 2}
  #@@options_arr = ["rock", "paper", "scissors"]

  def begin
    while true
      #Choose the game type
      game_type

      #break if @@second_player_move == "quit"

      #Player 1
      @your_move = get_an_answer

      #break if @@your_move == "quit"
        
      puts "The other player plays #{@second_player_move}"

      winner     
    end
  end

  def game_type
    
      puts "Do you want to play with computer or another player? (c for computer, p for human player)?"
      play_with = gets.chomp 
      play_with == "c" ? play_vs_computer : play_vs_human
      
  end

  def play_vs_computer
    @second_player_move = @@options.key(rand(3))
  end

  def play_vs_human
    puts "Player two, please enter your move"
    @second_player_move = get_an_answer
  end

  def get_an_answer
      while true
        puts "Please enter your move (rock, paper or scissors)"
        puts "Enter quit if you want to end the game."
        answer = gets.chomp

        if ["rock", "paper", "scissors"].include?(answer)
          return answer
        elsif answer == "quit"
          exit
        else
          puts "Your input is not valid"
          next
        end
        
      end
  end

  def winner
    if @your_move == @second_player_move
        puts "Tie"
    elsif [1,-2].include?(@@options[@your_move] - @@options[@second_player_move])
      puts "Congrats! You win."
    else
      puts "You lose!"
    end
  end
end
