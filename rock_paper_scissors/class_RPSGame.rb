class RPSGame
  attr_reader

  def initialize
    puts "Hello and welcome in Rock Paper Scissors Game"
    @player_one = HumanPlayer.new
  end

  def get_opponent
    loop do
      puts "Press 1 to play against computer, or 2 to play with another player"
      opponent_select = gets.chomp.to_i
      if opponent_select == 2
        puts "DBG: opponent_select = #{opponent_select.inspect}"
        @player_two = HumanPlayer.new
        puts "DBG: @player_two = #{@player_two.inspect}"
        break
      elsif opponent_select == 1
        @player_two = ComputerPlayer.new
        puts "DBG: @player_two = #{@player_two.inspect}"
        break
      else
        puts "We do not understand your selection. Please read instruction clearly."
      end
    end
  end

  def play
    get_opponent
    loop do
      @player_one.get_decision
      puts "DBG: player_one_choice = #{ @player_one.choice }"
      @player_two.get_decision
      puts "DBG: player_two_choice = #{ @player_two.choice }"
      break if check_victory(@player_one.choice, @player_two.choice)
      check_draw(player_one_choice, player_two_choice)
    end
  end

  def check_victory(player_one_choice, player_two_choice)
    if player_one_choice == 'p' && player_two_choice== 'r'
      player_two_choice= true
      puts "Paper Wins!!"
    elsif player_one_choice == "r" && player_two_choice== "s"
      player_one_choice = true
      puts "Rock Wins!!"
    elsif player_one_choice == 's' && player_two_choice== "p"
      puts "Scissors Wins!!"
    end
  end


  def check_game_over
    check_victory
    check_draw
    check_victory || check_draw
  end

  def check_victory
    Who wins?
    if winning(current_player)
      displays a victory message
      puts "Congratulations {@current_player.name}, the winner!!!"
      true
    else
      false
    end
  end

  def check_draw(player_one_choice, player_two_choice)
    If we see both players have teh same choices
    if player_one_choice == player_two_choice
      display draw message
      puts "Bummer, you've drawn..."
      true
    else
      false
    end
  end

  def switch_players
    if @current_plaer == @player_one
      @current_player = @player_two
    else
      @current_player = @player_one
    end
  end
end


class  HumanPlayer
  attr_accessor :choice

  def initialize
  end

  def get_decision
    loop do
      @choice = ask_for_choice
      if validate_choice_format(choice)
        break
      end
    end
  end

  def validate_choice_format(choice)
    if choice.size == 1 && ("rps".include? choice)
      true
    else
      puts "Please make correct selection."
    end
  end

  def ask_for_choice
    puts "Please call your selection by typing 'p' for paper, 's' for scissors or 'r' for rock"
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