class GameBase



  private



  def determine_round_winner(player1_weapon, player2_weapon)
    if player1_weapon == player2_weapon
      return 'tie'
    elsif player1_weapon == "r" && player2_weapon == "p"
      return 'player2'
    elsif player1_weapon == "p" && player2_weapon == "s"
      return 'player2'
    elsif player1_weapon == "s" && player2_weapon == "r"
        return 'player2'
    else
      return 'player1'
    end
  end

  def player_select_weapon
    puts "Please select a weapon by entering 'r', 'p', or 's':"
    puts "r: Rock"
    puts "p: Paper"
    puts "s: Scissors"
    gets.chomp.downcase
  end


end

class OnePlayerGame < GameBase

  def play
    puts "Playing against the computer!"
  end

  def computer_select_weapon
    ['r', 'p', 's'].sample
  end

end

class TwoPlayerGame < GameBase

  def play
    puts "Playing against Player 2!"
  end
end
