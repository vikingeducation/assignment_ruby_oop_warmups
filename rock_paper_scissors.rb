class RockPaperScissors
  attr_accessor :wins, :losses, :draws

  def initialize
    @wins = 0
    @losses = 0
    @draws = 0
  end

  def computer_move
    @computer_choice = ['rock', 'paper', 'scissors'].sample
  end

  def who_won?
    if @user_choice == @computer_choice
      @draws += 1
      puts "# It was a tie!"
      puts "<----------------------------->"
    elsif (@computer_choice == 'scissors' && @user_choice == 'paper') || (@computer_choice == 'paper' && @user_choice == 'rock') || (@computer_choice == 'rock' && @user_choice == 'scissors')
      @losses += 1
      puts "# The computer wins this round!"
      puts "<----------------------------->"
    else
      @wins =+ 1
      puts "# You won this round!"
      puts "<----------------------------->"
    end
  end

  def overall_winner?
    if @wins > @losses
      puts  "# You won! The final score was #{@wins} wins, #{@losses} losses, and #{@draws} draws."
      exit
    else
      puts  "# You lost! The final score was #{@wins} wins, #{@losses} losses, and #{@draws} draws. Better luck next time."
      exit
    end
  end

  def greet
    puts "# Let's play Rock, Paper, Scissors!"
    puts "# Let's do best 2 out of 3."
    puts "# Ready?"
    puts "# Begin!"
  end

  def prompt
    puts "Rock, Paper, Scissors, Shoot!"
    puts "Make your choice by typing, rock, paper, or scissors -->"
    @user_choice = gets.chomp.downcase
  end

  def display
    puts "# You chose #{@user_choice}"
    puts "# And I chose #{@computer_choice}"
  end

  def play
    greet
    while @wins < 2 && @losses < 2 do
      computer_move
      prompt
      display
      who_won?
    end
    overall_winner?
  end

end