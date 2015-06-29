class RockPaperScissors

  def initialize
    puts "Welcome to Rock Paper Scissors game"
    if playing_mode == "1"
      @player_1 = Player.new("player 1")
      @ai = AIGameplay.new
      keep_playing = true
      while keep_playing
        take_turn
        keep_playing = play_again?
      end
    end
    puts "Play again later! Bye."
  end

  def playing_mode
    print "Would you like to play (1) against the AI, or (2) multiplayer? "
    is_valid = false
    until is_valid
      input = gets.chomp
      is_valid = is_1_or_2?(input)
      print "Please enter 1 for solo and 2 for multiplayer: " unless is_valid
    end
    return input
  end


  def is_1_or_2?(input)
    ["1","2"].include?(input)
  end


  def play_again?
    is_valid = false
    until is_valid
      print "Do you want to play again? (Y/N): "
      input = gets.chomp.downcase
      is_valid = is_true_or_false?(input)
      puts "Try 'y' or 'n'" unless is_valid
    end
    return input == "y"
  end

  def is_true_or_false?(input)
    ["y", "n"].include?(input)
  end

  def compare_move(ai_value, person_value)
    if person_value == ai_value
      puts "You tied against the AI!"
    elsif person_win?(ai_value, person_value)
      puts "You win! Congratulations!"
    else
      puts "Sorry! You lost."
    end
  end

  def take_turn
    ai_value = @ai.turn
    person_value = @player_1.turn
    puts "The AI chose #{ai_value}"
    compare_move(ai_value, person_value)
  end

  def person_win?(ai_value, person_value)
    (person_value == "r" && ai_value == "s") ||
    (person_value == "p" && ai_value == "r") ||
    (person_value == "s" && ai_value == "p")
  end


end

class Player

  def initialize(name)
    @name = name
  end

  def turn
    is_valid = false
    until is_valid
      print "Enter your move ([R]ock, [P]aper, or [S]cissors): "
      input = gets.chomp.downcase
      is_valid = is_input_valid?(input)
      puts "Please enter 'r' 'p' or 's' to play" unless is_valid
    end
    return input
  end

  def is_input_valid?(input)
    ["r", "p", "s"].include?(input)
  end

end

class AIGameplay
  def turn
    ["r", "p", "s"].sample
  end

end
