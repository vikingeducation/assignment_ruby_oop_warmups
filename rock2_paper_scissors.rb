class RPSGame
  attr_reader :player_one_choice, :player_two_choice

  def initialize
    puts "Hello and welcome in Rock Paper Scissors Game"
    @player_one = HumanPlayer.new
  end

  def get_opponent
    loop do
      puts "Press 1 to play against computer, or 2 to play with another player"
      opponent_select = gets.chomp.to_i
      if opponent_select == 2
        @player_two = HumanPlayer.new
        break
      elsif opponent_select == 1
        @player_two = ComputerPlayer.new
        break
      else
        puts "We do not understand your selection. 
              Please read instruction clearly."
      end
    end
  end

  def play

    get_opponent

    loop do
      player_one_choice = @player_one.get_decision
      player_two_choice = @player_two.get_decision
      puts "So player's One choice is #{player_one_choice}"
      puts "and player's Two choice is #{player_two_choice}"
      check_victory(player_one_choice, player_two_choice)
      check_draw(player_one_choice, player_two_choice)
      break if ending_game != "y"
    end
  end

  def check_victory(player_one_choice, player_two_choice)
    if player_one_choice == "p" && player_two_choice == "r" ||player_one_choice == "r" && player_two_choice == "p"
      puts "Paper Wins!!!"
      true
    elsif player_one_choice == "p" && player_two_choice == "s" ||player_one_choice == "s" && player_two_choice == "r"
      puts "Scissors Wins!!!"
      true
    elsif player_one_choice == "s" && player_two_choice == "r" ||player_one_choice == "r" && player_two_choice == "s"
      puts "Rock Wins!!!"
      true
    end
  end

def ending_game
  puts "Would you like to play again? Please type 'y' to try again /
        or any other key to exit the game"
  gets.chomp
end

  #check_gme_over
  def check_game_over
    check_victory || check_draw
  end

  def check_draw(player_one_choice, player_two_choice)
    if player_one_choice == player_two_choice
      puts "Bummer, you've drawn..."
      true
    else
      false
    end
  end
end

class  HumanPlayer
  attr_accessor :choice

  def get_decision
    loop do
      @choice = ask_for_choice
      if validate_choice_format(@choice)
        break
      end
    end
    @choice
  end

  def validate_choice_format(var_choice)
    if var_choice.size == 1 && ("rps".include? var_choice)
      true
    else
      puts "You have entered incorrect letter. Please make correct selection."
    end
  end

  def ask_for_choice
    puts "Please call your selection by typing 
          'p' for paper, 's' for scissors or 'r' for rock"
    gets.chomp
  end
end

class ComputerPlayer
  attr_accessor :choice

  def initialize
    @choice = choice
  end

  def get_decision
    @choice = ["p","r","s"][rand(3)]
  end

end

t = RPSGame.new
t.play