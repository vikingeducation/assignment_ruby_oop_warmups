require 'io/console'

class RPS

  # game = RPS.new
  # game.play to start

  def initialize
    @moves = ['r', 'p', 's']
    @emoji = {'r' => '👊 ', 'p' => '🖐 ', 's' => '✌️ ' }
    @playmode = ''
    @player1 = ''
    @player2 = ''
    @computer = ''
    @computer_win = ['Computer!-Oh hey, that\'s me!', 'meeeeeeeeeeeeee! 👾 ', 'not you :(', 'Computer']
  end

  def play
    welcome

    playmode until valid_mode?(@playmode)

    if @playmode == '1'
      single until game_over?(@player1, @computer)
      puts "The winner is #{winner(@player1, @computer) == @player1? 'you!' : @computer_win.sample}\n\n"
    else
      two_player until game_over?(@player1, @player2)
      puts "Congratulations #{winner(@player1, @player2) == @player1? 'Player1' : 'Player2'}! You've won!\n\n"
    end
    reset_game if play_again?

  end

  def reset_game
    @player1 = ''
    @playmode = ''
    @player2 = ''
    @computer = ''
    play
  end

  def play_again?
    puts "Enter 'y' to play again; 'q' to quit"
    print "Play again? "
    decision = gets.chomp
    exit if decision == 'q'
    return true if decision == 'y'
    play_again?
  end

  def valid_mode?(mode)
    mode == '1' || mode == '2'
  end

  def valid_move?(move)
    exit if move == 'q'
    move == 'r' || move == 's' || move == 'p'
  end

  def game_over?(player1, player2)
    player1 != player2 && player1 != ''
  end

  def winner(player1, player2)
    if player1 == 'r' && player2 == 's' || player1 == 's' && player2 == 'p' ||  player1 == 'p' && player2 == 'r'
      player1
    else
      player2
    end
  end

  def random_move
    @moves.sample
  end

  def two_player
    puts "Choose your weapon:"
    puts "Enter 'r' for rock, 'p' for paper, 's' for scissors\n\n"
    until valid_move?(@player1)
      print "Player1: "
      @player1 = STDIN.noecho(&:gets).chomp
      puts "\n"
    end
    until valid_move?(@player2)
      print "Player2: "
      @player2 = STDIN.noecho(&:gets).chomp
      puts "\n"
    end
    puts "Player1 played #{@emoji[@player1]}"
    puts "Player2 played #{@emoji[@player2]}"

  end

  def single
    puts "Choose your weapon:"
    puts "Enter 'r' for rock, 'p' for paper, 's' for scissors\n\n"
    until valid_move?(@player1)
      print "Player 1: "
      @player1 = gets.chomp
    end
    @computer = random_move
    puts "Computer: #{@computer}"
    puts "It's a tie! Go again\n\n" unless game_over?(@player1, @computer)
  end

  def welcome
    puts "\n===================================================="
    puts "Welcome to 👊   🖐   ✌️  !"
    puts "(That's emoji for rock, paper, scissors)"
    puts "====================================================\n\n"
  end

  def playmode
    puts "Choose a play mode:"
    puts "Enter '1' for single player"
    puts "Enter '2' for two-player"
    puts "Enter 'q' to quit\n\n"
    print "Play mode: "
    @playmode = gets.chomp

    exit if @playmode == 'q'

    puts "\n"

    # Inform user of their choice
    puts "You have chosen single player mode! May the odds be ever in your favour!" if @playmode == '1'
    puts "You have chosen to play against a friend. May the best friend win!" if @playmode == '2'
    puts "\n"
  end


end

g = RPS.new
g.play
