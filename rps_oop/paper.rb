require "./player"

class Paper < Player

  def name
    @name = "The Paperboy"
  end


  def choose_weapon(player_weapon)

    r = rand(1..6)

    if player_weapon == "paper"
      if r < 5
        return "paper"
      elsif r == 5
        return "rock"
      elsif r == 6
        return "scissors"
      end
    else
      if r < 3
        return "rock"
      elsif r.between?(2, 4)
        return "paper"
      elsif r > 4
        return "scissors"
      end
    end

  end

end