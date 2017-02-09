class Game
  CHOICES = %w[rock paper scissors quit]
  BEATS = {
    'rock' => 'paper',
    'paper' => 'scissors',
    'scissors' => 'rock',
  }

  # pass true for two player mode
  def initialize(two_player = false)
    @two_player_mode = two_player
    play
  end

  def human_choice
    loop do
      puts "Your choice: #{CHOICES}? "
      choice = gets.chomp.downcase
      if !CHOICES.include?(choice)
        puts "Invalid answer, try again!"
        next
      end
      return choice
    end
  end

  def computer_choice
    return CHOICES.slice(0,3).sample
  end

  def second_player_choice
    if @two_player_mode
      puts "Second player's turn: "
      player2_choice = human_choice
    else
      player2_choice = computer_choice
    end
  end

  def check_win(choice1, choice2)
    if choice1 == choice2
      puts "It's a draw!\n\n"
    elsif choice1 == BEATS[choice2]
        puts "Player 1 won!\n\n"
    else
      puts "Player 2 won!\n\n" if @two_player_mode
      puts "Computer won!\n\n" if !@two_player_mode
    end
  end

  def play
    loop do
      puts "First player's turn: "
      player1_choice = human_choice
      break if player1_choice == "quit"
      player2_choice = second_player_choice
      break if player2_choice == "quit"
      puts "\nPlayer 1 picked: #{player1_choice}, player 2 picked: #{player2_choice}!"
      check_win(player1_choice, player2_choice)
    end
  end
end

Game.new(true)