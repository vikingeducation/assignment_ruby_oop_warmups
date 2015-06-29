=begin 
    
    - Rock Paper sissors class - with method "main" which runs the program
    - first class , asking players choice?
    - 2nd class computer choice
    - a method in RockPaperSissors compare the 2 inputs
    - method to return winner

=end

class RockPaperScissors
 
  def main

    player = PlayerChoice.new
    computer = ComputerChoice.new

  end

  def compare

  end

  def winner

  end

end

class PlayerChoice
  attr_accessor :player_choice
  
  def intialize
    puts "what is your weapon? "
    @player_choice = gets.chomp
  end

end

class ComputerChoice
  attr_accessor :computeR_choice
  
  def intialize
    num = rand(3)
    rps = ["rock", "paper" , "scissors"]

      @computer_choice = rps[num]

  end
  
end

