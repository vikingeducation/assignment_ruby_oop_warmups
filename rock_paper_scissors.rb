

class  HumanPlayer
  def play
    choice = ""
    if choice != "r" || choice != "p" || choice != "s"
      puts "Please call your selection by typing 'p' for paper, 's' for scissors or 'r' for rock"
      choice = gets.chomp
      self.play
    else
      puts "Please make correct selection."
      self.play
    end
    choice
  end
end

class ComputerPlayer
  def play
    choice = ["p","r","s"][rand(3)]
    choice
  end
end

class RPSGame

  def initialize(player_one)
    player_one = HumanPlayer.new
  end

  def player_chooser
    puts "Hello and welcome in Rock Paper Scissors Game"
    puts "Press 1 to play against computer, or 2 to play with another player"
    opponent_select = gets.chomp.to_i
    if opponent_select == 2
      @player_two = HumanPlayer.new
    elsif opponent_select == 1
      @player_two = ComputerPlayer.new
    else
      puts "We do not understand your selection. Please read instruction clearly."
      player_chooser
    end
    @player_two
  end


  @str_1 = player_one.play
  @str_2 = @player_two.play


  def winner
    if @str_1 == 'p' && @str_2 == 'r'
      @str_2 = true
      puts "Paper Wins!!"
    elsif @str_1 == "r" && @str_2 == "s"
      @str_1 = true
      puts "Rock Wins!!"
    elsif @str_1 == 's' && @str_2 == "p"
      puts "Scissors Wins!!"
    else
      puts "We have a draw!!"
    end
  end

end
