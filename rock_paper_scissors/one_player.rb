class OnePlayer

  def initialize()
  end

  def get_input()
    p "Your move! Do you pick rock, paper or scissors?"
    sleep(1)
    p "Press '1' for rock"
    sleep(1)
    p "Press '2' for scissors"
    sleep(1)
    p "Press '3' for paper"
    @input = gets.chomp
    return @input
  end

  def computer_move()
    p "The computer also just selected its move as you placed your choice!"
    sleep(1)
    @computer = (rand * 3).ceil
    @computer = @computer.to_s
    if @computer == '1'
      p "It chose: rock"
    elsif @computer == '2'
      p "It chose: scissors"
    elsif @computer == '3'
      p "It chose: paper"
    end
    return @computer
  end

  def results(input, computer)
    sleep(2)
    if input == computer
      p "It's a tie!"
    elsif (input == '1' && computer == '2') || (input == '2' && computer == '3') || (input == '3' && computer == '1') #player wins
      p "You win!"
    else
      p "You lose"
    end
  end

end
