require "./player"

class Rock < Player

  def name
    @name = "Rocky"
  end


  def choose_weapon(player_weapon)

    r = rand(1..6)

    if player_weapon == "rock"
      if r < 5
        return "rock"
      elsif r == 5
        return "paper"
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