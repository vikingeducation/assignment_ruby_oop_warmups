class RockPaperScissors

  def initialize
    puts "Welcome to Rock Paper Scissors game"
    keep_playing = true
    while keep_playing
      take_turn
      keep_playing = play_again?
    end
    puts "Play again later! Bye."
  end

  def play_again?
    print "Do you want to play again? (Y/N): "
    input = gets.chomp.downcase
    return input == "y"
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
    options = ["r", "p", "s"]
    number = rand(0..2)
    ai_value = options[number]
    print "Enter your move ([R]ock, [P]aper, or [S]cissors): "
    person_value = gets.chomp.downcase
    puts "The AI chose #{ai_value}"
    compare_move(ai_value, person_value)
  end

  def person_win?(ai_value, person_value)
    (person_value == "r" && ai_value == "s") ||
    (person_value == "p" && ai_value == "r") ||
    (person_value == "s" && ai_value == "p")
  end


end

