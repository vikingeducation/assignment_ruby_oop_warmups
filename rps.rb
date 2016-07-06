class RPS
  #one player against computer
  #two player mode
  OPTIONS = ["paper", "scissor", "rock"]

  def initialize(players)
    @players = players
    @game_over = false
    
    puts " --------------------------"
    puts "This is rock paper scissors game"
    puts "Scissor beats Paper"
    puts "Rock beats Scissor"
    puts "Paper beats Rock"
    puts "\n -------------------------- \n"
  end

  #script
  def play
    while @game_over == false
      print "What is player 1's move? Type 'Rock', 'Paper', or 'Scissors': "
      #player move
      player1_input = get_input
      player2_input = ""

      if @players == 1
        player2_input = OPTIONS.sample
      #two-player
      else
        print "What is player 2's move? Type 'Rock', 'Paper', or 'Scissors': "
        player2_input = get_input
      end

      puts "\nPlayer 1 chooses: ", player1_input
      puts "Player 2 chooses: ", player2_input

      outcome = compare_moves(player1_input, player2_input)
      #determines
      if outcome == 1 
        print player1_input, " beats ", player2_input, " Player 1 has won the game \n"
        @game_over = true
      elsif outcome == -1
        print player2_input, " beats ", player1_input, " Player 2 has won the game \n"
        @game_over = true
      else 
        puts "It's a tie, try again \n"
      end
    end
  end

  #makes sure player(s) input is legal
  def get_input
    player_input = ""
    until OPTIONS.include?(player_input)
      print player_input == "" ? "" : "That isn't part of the game, type 'Rock', 'Paper', or 'Scissors': "
      player_input = gets.chomp.downcase
    end
    return player_input
  end

  #Compares scissor-rock-paper
  def compare_moves(user_input, user2_input)
    if user_input.length == user2_input.length
      0
    elsif user_input == OPTIONS[0]
      user2_input == OPTIONS[1] ? -1 : 1
    elsif user_input == OPTIONS[1]
      user2_input == OPTIONS[2] ? -1 : 1
    elsif user_input == OPTIONS[2]
      user2_input == OPTIONS[0] ? -1 : 1
    end
  end
end

a_game = RPS.new(2)
a_game.play