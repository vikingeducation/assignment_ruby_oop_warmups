class RockPaperScissors
  attr_accessor :p1_wins, :p1_losses, :p1_draws, :num_of_players, :p2_wins, :p2_losses, :p2_draws

  def initialize
    @p1_wins = 0
    @p1_losses = 0
    @p1_draws = 0
    @num_of_players = 0
    @p2_wins = 0
    @p2_losses = 0
    @p2_draws = 0
  end

  def computer_move
    @p2_choice = ['rock', 'paper', 'scissors'].sample
  end

  def who_won?
    if @p1_choice == @p2_choice
      @p1_draws += 1
      @p2_draws += 1
      puts "# It was a tie!"
      puts "<----------------------------->"
    elsif (@p2_choice == 'scissors' && @p1_choice == 'paper') || (@p2_choice == 'paper' && @p1_choice == 'rock') || (@p2_choice == 'rock' && @p1_choice == 'scissors')
      @p1_losses += 1
      @p2_wins += 1
      puts "# Player 2 wins this round!"
      puts "<----------------------------->"
    else
      @p1_wins += 1
      @p2_losses += 1
      puts "# Player 1 wins this round!"
      puts "<----------------------------->"
    end
  end

  def overall_winner?
    if @p1_wins > @p2_wins
      puts  "# Player 1 wins with #{@p1_wins} wins, #{@p1_losses} loss(es), and #{@p1_draws} draw(s)."
      exit
    else
      puts  "# Player 2 wins with #{@p2_wins} wins, #{@p2_losses} loss(es), and #{@p2_draws} draw(s)."
      exit
    end
  end

  def greet
    puts "# Let's play Rock, Paper, Scissors!"
    puts "# Let's do best 2 out of 3."
    puts "# Ready?"
    puts "# Begin!"
  end

  def p1_prompt
    puts "Rock, Paper, Scissors, Shoot!"
    puts "Player 1 make your choice by typing, rock, paper, or scissors -->"
    @p1_choice = gets.chomp.downcase
  end

  def p2_prompt
    puts "Rock, Paper, Scissors, Shoot!"
    puts "Player 2, make your choice by typing, rock, paper, or scissors -->"
    @p2_choice = gets.chomp.downcase
  end

  def display
    puts "# Player 1 chose #{@p1_choice}"
    puts "# And Player 2 chose #{@p2_choice}"
  end

  def players?
    puts "# Enter 1 or 2 for 1-player or 2-player."
    puts "# ----->"
    @num_of_players = gets.chomp.to_i
  end

  def one_player_game
    while @p1_wins < 2 && @p1_losses < 2 do
      computer_move
      p1_prompt
      display
      who_won?
    end
  end

  def two_player_game
    while @p1_wins < 2 && @p1_losses < 2 do
      p1_prompt
      p2_prompt
      display
      who_won?
    end
  end

  def play
    greet
    players?
    if @num_of_players == 1
      one_player_game
    else #@num_of_players == 2
      two_player_game
    end
    overall_winner?
  end
end