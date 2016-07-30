class Game
  @@towers = [[1, 2, 3], [], []]

  def play
    until game_over?
      puts "select rod to TAKE from: "
      from = gets.chomp.to_i - 1
      if from.to_s == "q"
        puts "Thanks for playing"
        puts "Have a wonderful day..."
        exit
      elsif @@towers[from].first == nil && from.to_s != "q"
        puts "You chose empty rod"
      else
        disc = @@towers[from].shift
        puts "select rod to PUT disc in: "
        to = gets.chomp.to_i - 1
        @@towers[to].unshift(disc)
        p @@towers
      end
    end
  end

  def game_over?
    if @@towers[0].size == 0 && @@towers[2].size == 3
      puts "You won!"
      puts "You deserve a cup of coffee now.."
      true
    end
  end
end
