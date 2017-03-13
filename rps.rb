class RPS

  def initialize 
    @number_of_players = 1
    number_of_players
    
    if @number_of_players == 1
      @player_1 = Player.new("Player 1", true)
    else 
      @player_1 = Player.new("Player 1", false)
    end
    @player_2 = Player.new("Player 2", false)
    
    instructions
  end

  def number_of_players
    print "Number of players? (1 or 2): "
    @number_of_players = gets.chomp.to_i
  end

  def instructions
    puts
    puts "=================================="
    puts "Welcome to Rock, Paper, Scissors."
    puts
    puts "The rules of the game are:"
    puts
    puts "Rock beats scissors."
    puts "Scissors beat paper."
    puts "Paper beats rock."
    puts
    puts "Now get ready and make your choice!"
    puts "=================================="
  end

  def play
    loop do
      @player_1.get_choice
      @player_2.get_choice
            
      break if end_game?

      check_winner
    end
  end

  def check_winner
    player_1_choice = @player_1.instance_variable_get("@choice")
    player_2_choice = @player_2.instance_variable_get("@choice")    
    
    puts
    puts "Rock... Paper... Scissors! Freeze."
    puts
    puts "Player 1 picked #{player_1_choice}"
    puts "Player 2 picked #{player_2_choice}"
    puts "==============="
    case player_1_choice
    when "rock"
      if player_2_choice == "rock"
        puts "It's a draw!"
      elsif player_2_choice == "paper"
        puts "Player 2 wins!"
      else
        puts "Player 1 wins!"
      end
    when "paper"
      if player_2_choice == "paper"
        puts "It's a draw!"
      elsif player_2_choice == "scissors"
        puts "Player 2 wins!"
      else
        puts "Player 1 wins!"
      end
    when "scissors"
      if player_2_choice == "scissors"
        puts "It's a draw!"
      elsif player_2_choice == "rock"
        puts "Player 2 wins!"
      else
        puts "Player 1 wins!"
      end
    end
    puts
  end

  def end_game?
    if @player_1.instance_variable_get("@choice").downcase == "exit" || @player_2.instance_variable_get("@choice").downcase == "exit" 
      puts
      puts "Thanks for playing! See you next time."
      puts
      true
    end
  end

end

class Player
  
  def initialize(name = "Anonymous", is_bot)
    @choice = ""
    @name = name
    @is_bot = is_bot
  end

  def get_choice
    if @is_bot == true
      @choice = ["rock", "scissors", "paper"].sample
    else
      loop do
        print "#{@name}, enter your pick (type 'exit' to end the game): "
        @choice = gets.chomp.downcase
        break if valid_choice?(@choice)
      end
    end
  end

  def valid_choice?(choice)
    if choice == "rock" || choice == "paper" || choice == "scissors" || choice == "exit" 
      true
    else 
      puts
      puts "That's an invalid pick. Valid inputs are 'rock', 'paper' or 'scissors'."
      puts
    end
  end
   
end

RPS.new.play