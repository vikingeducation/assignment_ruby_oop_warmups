class Game
  def initialize
    @moves_array = ['rock','paper', 'scissors']
  end

  def computer_move
    move = @moves_array[rand(3)]
  end

  def user_move
    go_on = true
    while go_on == true
      puts "rock, paper, scissors?" 
      usermove = gets.strip.downcase
      unless @moves_array.include?(usermove) == true 
        puts "invalid input"
      else
        go_on = false 
      end 
    end
    usermove
  end

  def game_logic(player1_move, player2_move)
    if player1_move == player2_move
      puts "Draw"
    elsif player1_move == "rock"
      if player2_move == "paper"
        puts "you lose"
      else 
        puts "you win"
      end
    elsif player1_move == "scissors"
      if player2_move == "rock"
        puts "you lose"
      else 
        puts "you win"
      end
    elsif player1_move == "paper"
      if player2_move == "scissors"
        puts "you lose"
      else 
        puts "you win"
      end
    end
  end

  def play(players = 1)
    if players == 1
      comp_move = computer_move
      u_move = user_move
      game_logic(u_move, comp_move)
    elsif players == 2
      comp_move = computer_move
      u_move = user_move
      game_logic(u_move, comp_move)
    else
      puts "Invalid input, mass multiplayer not supported"
    end
      
  end
end

firstgame = Game.new
firstgame.play