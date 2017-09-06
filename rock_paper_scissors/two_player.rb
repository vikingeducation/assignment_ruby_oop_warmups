class TwoPlayer

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
    p "Now proceeding to hide your move from your friend."
    sleep(1)
    100.times{p "--------"}
    return @input
  end

  def friend_input()
    p "Friend's move! Do you pick rock, paper or scissors?"
    sleep(1)
    p "Press '1' for rock"
    sleep(1)
    p "Press '2' for scissors"
    sleep(1)
    p "Press '3' for paper"
    @friend = gets.chomp
    return @friend
  end

  def results(input, friend)
    sleep(2)
    if input == friend
      p "It's a tie!"
    elsif (input == '1' && friend == '2') || (input == '2' && friend == '3') || (input == '3' && friend == '1') #player wins
      p "You win!"
    else
      p "Your friend wins!"
    end
  end

end
