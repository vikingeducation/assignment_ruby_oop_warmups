class OnePlayer

  def initialize()
  end

  def get_input()
    p "Your move! Do you pick rock, paper or scissors?"
    p "Press '1' for rock"
    p "Press '2' for scissors"
    p "Press '3' for paper"
    @input = gets.chomp
    return @input
  end

  def computer_move()
    p "The computer also just selected its move as you placed your choice!"
    @computer = (rand * 3).ceil
    @computer = @computer.to_s
    p @computer
    return @computer
  end

  def results(input, computer)
    if input == computer
      p "It's a tie!"
    elsif (input == '1' && computer == '2') || (input == '2' && computer == '3') || (input == '3' && computer == '1') #player wins
      p "You win!"
    else
      p "You lose"
    end
  end 

end
