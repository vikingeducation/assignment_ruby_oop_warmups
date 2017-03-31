#OOP1: rock, paper, scissors game
class RPSGame

  def initialize
    @rock = "rock"
    @paper = "paper"
    @scissors = "scissors"
    @user_score = 0
    @user_current_throw = nil
    @comp_score = 0
    @comp_current_throw = nil
  end #end of initialize method


  #get user move
  def get_user_selection
    guess_again = true
    until guess_again == false
      puts "Please choose rock, paper, or scissors (or q to quit)"
      @user_current_throw = gets.chomp
      case @user_current_throw.downcase
      when "q"
        puts "Thanks for playing!"
        exit
      when "rock"
        @user_current_throw = @rock
        guess_again = false
      when "scissors"
        @user_current_throw = @scissors
        guess_again = false
      when "paper"
        @user_current_throw = @paper
        guess_again = false
      else
        puts "That is not a valid entry"
        guess_again = true
      end
    end #end of until
  end #end of get_user_selection method


  #get computer move
  def get_comp_selection
    @comp_current_throw = ["rock", "paper", "scissors"].sample
  end #end of get_comp_selelction method


  #how do you know who won the round
  def play_round
    puts "Your throw: #{@user_current_throw}"
    puts "Computers throw: #{@comp_current_throw}"
    case @user_current_throw
    when @rock
      if @comp_current_throw == @rock
        puts "Tie! play again"
      elsif @comp_current_throw == @scissors
        @user_score += 1
        puts "You win this round!"
      elsif @comp_current_throw == @paper
        @comp_score += 1
        puts "Computer wins this round"
      end
    when @paper
      if @comp_current_throw == @paper
        puts "Tie! play again"
      elsif @comp_current_throw == @rock
        @user_score += 1
        puts "You win this round!"
      elsif @comp_current_throw == @scissors
        @comp_score += 1
        puts "Computer wins round"
      end
    when @scissors
      if @comp_current_throw == @scissors
        puts "Tie! play again"
      elsif @comp_current_throw == @paper
        @user_score += 1
        puts "You win this round!"
      else
        puts "Computer wins round"
        @comp_score += 1
      end
    end #end of case/when
    puts "Current scores: You: #{@user_score}  Computer: #{@comp_score}"
  end #end of win_round method


 #how to know who won game
  def win_game?
    if @user_score == 2 && (@user_score + @comp_score) == 3
      puts "You win!!!"
      return true
    elsif @comp_score == 2 && (@user_score + @comp_score) == 3
      puts "You lost, better luck next time!"
      return true
    else
      return false
    end
  end #end of win? method


 #option if they want to keep playing to see who is best out of five
  def best_out_of_five?
    if @user_score == 3 && (@user_score + @comp_score) == 5
      puts "You win the game!!!"
      return true
    elsif @comp_score == 3 && (@user_score + @comp_score) == 5
      puts "You lost the game, better luck next time!"
      return true
    else
      return false
    end
  end #end of best_of_five method


  #need play method to put the pieces together
  def play_game
    until win_game? == true do
      get_user_selection
      get_comp_selection
      play_round
    end #end of until

    #adding option to play best of out of 5
    puts "You you like to play best out of 5? (enter \"yes\" or \"no\")"
    user_answer = gets.chomp.downcase

    if user_answer == "y" || user_answer == "yes"
      until best_out_of_five? == true do
        get_user_selection
        get_comp_selection
        play_round
      end
    else
      puts "Until next time, have a great day!!"
    end

  end #end of play method

end #end of RPSPlay

n = RPSGame.new
n.play_game
