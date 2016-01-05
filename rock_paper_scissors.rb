# rock > scissors
# scissors > paper
# paper > rock

class Game
  def initialize ()
  end
  @@winning_move = {:rock =>'scissors', :scissors =>'paper',:paper=>'rock'}

    def rock_paper_scissors_play
        puts "\nHow many players? Please enter 1 or 2"
        player_number = gets.chomp

        if player_number == 1
          puts "\nEnter rock, paper or scissors."
          player= Player.new (gets.chomp)
          computer = Player.new.possible_moves.sample
          winner = determine_winner(player.move, computer.move)
          
            if winner == player.move
              puts "Yay you win!"
            elsif winner == computer.move
              puts "Robots rule the world."
            else 
              puts "Tied."
            end

        elsif player_number == 2
          puts "Player 1, enter rock, paper or scissors."
          player1 = Player.new(gets.chomp)
          puts "Player 2, enter rock, paper or scissors."
          player2 = Player.new(gets.chomp)  

          winner = determine_winner(player1.move, player2.move)

          if winner == player1.move
            puts "Player 1 Wins"
          elsif winner == player2.move
            puts "Player 2 Wins"
          else
            puts "Tied."
          end      
        end      

    end

    def determine_winner(input1, input2)
        if @@winning_move[input1] == input2
          return input1
        elsif @@winning_move[input2] == input1
          return input2
        else 
          return 0
        end
    end
  
end



class Player
  def initialize(move)
    @move = move
  end
  @@possible_moves= ['rock', 'paper', 'scissors']

    def get_user_input
    puts "\nEnter your input."
    player_move = gets.chomp    
    end

    def computer_input 
    move_array = ['rock', 'paper', 'scissors']
    move_array.sample
    end
end

## need to get if it's a one or two player game
#if one, prompt user, prompt computer
#if two, promt user1, promt user2, compare
#don't need to put everything in the player class
#you could have a game class and a player class
#game.new-->could prompt user for number of players
#you could potentially have game always generate two players and base on user input assign one to computer
#really only need game or player class






