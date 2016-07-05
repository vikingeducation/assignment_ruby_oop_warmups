# class called RPS
# method: get method takes user input turned into command
# method: computer randomly select: rock/paper/scissors
# instance variable: computer decision
# instance variable: human decision
# method: turn gets everything going
# method: new/initialize
# method: compare method for winner

class RockPaperScissors

  def initialize

  end

  def play
    puts "Welcome to Rock Paper Scissors!"
    puts "Choose your weapon:"
    @user_decision = gets.chomp.downcase
    @computer_decision = ["rock", "paper", "scissors"][rand(3)]
    compare(@user_decision, @computer_decision)
    puts "Play again?"
    if gets.chomp.downcase == "y"
      play
    elsif gets.chomp.downcase == "n"
      exit
    end
  end

  def compare(human, computer)
    if human == computer
      puts "It was a tie!"
    elsif human == "rock"
      if computer == "paper"
        puts "Computer wins!"
      elsif computer == "scissors"
        puts "You win!"
      end
    elsif human == "paper"
      if computer == "scissors"
        puts "Computer wins!"
      elsif computer == "rock"
        puts "You win!"
      end
    elsif human == "scissors"
      if computer == "rock"
        puts "Computer wins!"
      elsif computer == "paper"
        puts "You win!"
      end
    end
  end

end