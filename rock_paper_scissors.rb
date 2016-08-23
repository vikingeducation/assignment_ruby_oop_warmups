class RockPaperScissors
  attr_reader :num_rounds, :player1_wins, :player2_wins, :computer

  def initialize(params)
    @num_rounds = params[:num_rounds]
    @player1_wins = 0
    @player2_wins = 0
    @computer = params[:single_player]
  end

  def make_move(player1_selection, player2_selection)
    p1 = player1_selection.upcase
    p2 = player2_selection.upcase
    case p1
    when p2
      return 0
    when "R"
      if p2 == "P"
        return 1
      elsif p2 == "S"
        return -1
      end
    when "P"
      if p2 == "S"
        return 1
      elsif p2 == "R"
        return -1
      end
    when "S"
      if p2 == "R"
        return 1
      elsif p2 == "P"
        return -1
      end
    end
  end

  def get_move(player)
    puts "Player #{player} what is your move? Enter a move in the format R, for rock, P, for paper, and S, for scissors."
    move = gets.chomp
    until move == "R" || move == "P" || move == "S"
      puts "Please enter either an R, or a P, or an S as your move..."
      move = gets.chomp
    end
    return move
  end

  def play_game
    moves = ["R", "P", "S"]
    puts "Welcome to Rock Paper Scissors!"
    if @computer
     puts "You are playing single player."
    else
      puts "You are playing multiplayer."
    end
    @num_rounds.times do |round|
      puts "Round #{round + 1}! Fight!"
      move1 = get_move(1)
      move2 = ""
      if @computer
        move2 = moves[rand(3)]
      else
        move2 = get_move(2)
      end
      case make_move(move1, move2)
      when -1
        @player1_wins += 1
        puts "Player 1 wins this round!"
      when 1
        @player2_wins += 1
        if @computer
          puts "The computer wins this round!"
        else
          puts "Player 2 wins this round!"
        end
      when 0
        @player2_wins += 1
        @player1_wins += 1
        puts "This round is a draw!"
      end
      puts "The current score is:"
      puts "Player 1 has: #{@player1_wins} wins"
      if @computer
        puts "The Computer has: #{@player2_wins} wins"
      else
       puts "Player 2 has: #{@player2_wins} wins"
     end
    end
    if @player1_wins > @player2_wins
      puts "Player 1 wins with #{player1_wins} wins to #{player2_wins}"
    elsif @player2_wins > @player1_wins
      if @computer
        puts "The Computer wins with #{player2_wins} wins to #{player1_wins}"
      else
        puts "Player 2 wins with #{player2_wins} wins to #{player1_wins}"
      end
    else
      puts "Its a draw!"
    end
  end

end
