# rps.rb
require 'pry'
require 'io/console'
require_relative 'player'

IS_ROBOT = true
ROCK = 'Rock'.freeze
PAPER = 'Paper'.freeze
SCISSORS = 'Scissors'.freeze
VALIDPLAYS = %w(r p s).freeze
VALIDPLAYSLONG = %w(ROCK PAPER SCISSORS).freeze
OUTPUTWIDTH = 25

# RPS class
class RPS
  def initialize
    puts 'DEBUG: RPS - init'
    @valid_input = 'Valid input: [r/R] = Rock, [p/P] = Paper, [s/S] = Scissors'
    @valid_quit = 'q/Q to quit'
    @human_players = 1
    @player1 = nil
    @player2 = nil
  end

  def play
    system 'clear'
    puts 'Welcome to an epic match up of R/P/S'
    puts '1 or 2 players?...only 1 for now.'
    puts @valid_input
    # puts @valid_quit
    if @human_players == 1
      @player1 = Player.new('Player1', !IS_ROBOT)
      @player2 = Player.new('Robot', IS_ROBOT)
    end

    continue = true
    round = 1

    show_score(false)
    while continue
      reset_moves
      puts "Round: #{round}"
      get_moves
      check_results
      show_score(false)
      round += 1
      continue = again_or_quit
    end
    puts
    puts 'Thanks for playing!'
    puts' Here are the final results'
    show_score(true)
  end

  def again_or_quit
    print 'Another round? (Y/N):'
    # play = STDIN.noecho(&:gets)
    play = gets.chomp.downcase
    puts
    return false if play == 'n'
    true
  end

  def reset_moves
    @player1.move = ''
    @player2.move = ''
  end

  def check_results
    puts
    if @player1.move == @player2.move
      puts "It's a tie! Re-shoot!"
    elsif @player1.move == 'r'
      if @player2.move == 'p'
        puts "PAPER beats ROCK! Point #{@player2.name}"
        @player2.score += 1
      else
        puts "ROCK beats SCISSORS! Point #{@player1.name}"
        @player1.score += 1
      end
    elsif @player1.move == 'p'
      if @player2.move == 'r'
        puts "PAPER beats ROCK! Point #{@player1.name}"
        @player1.score += 1
      else
        puts "SCISSORS beats PAPER! Point #{@player2.name}"
        @player2.score += 1
      end
    elsif @player1.move == 's'
      if @player2.move == 'r'
        puts "ROCK beats SCISSORS! Point #{@player2.name}"
        @player2.score += 1
      else
        puts "SCISSORS beats PAPER! Point #{@player1.name}"
        @player1.score += 1
      end
    else
      puts 'I assume quit.'
    end
    puts
  end

  def get_moves
    print "1. #{@player1.name} "
    @player1.move = player_move(@player1.robot)
    print "2. #{@player2.name} "
    @player2.move = player_move(@player2.robot)
    player1_move = VALIDPLAYSLONG[VALIDPLAYS.index(@player1.move)]
    player2_move = VALIDPLAYSLONG[VALIDPLAYS.index(@player2.move)]
    puts "  >#{@player1.name.ljust(10)} => #{player1_move}"
    puts "  >#{@player2.name.ljust(10)} => #{player2_move}"
  end

  def player_move(robot)
    valid_move = false
    if robot
      puts '...is...thinking...'
      rando = rand(0..2)
      play = VALIDPLAYS[rando]
      valid_move = true
    end
    until valid_move
      print 'Enter Play then Enter: [r/R,p/P,s/S]:'
      play = STDIN.noecho(&:gets)
      play = play.chomp.downcase
      puts
      valid_move = validate_play(play)
    end
    play
  end

  def show_score(final)
    print_dash_line
    out = if final
            'FINAL SCORE'.center(OUTPUTWIDTH)
          else
            'SCORE'.center(OUTPUTWIDTH)
     end
    puts out
    print_dash_line
    puts "#{@player1.name}:#{@player1.score}".center(OUTPUTWIDTH)
    puts "#{@player2.name}:#{@player2.score}".center(OUTPUTWIDTH)
    print_dash_line
  end

  def print_dash_line
    OUTPUTWIDTH.times { print '-' }
    puts
  end

  def validate_play(play)
    # puts "DEBUG: play = #{play}"
    check = VALIDPLAYS.any? { |ele| ele == play }
    puts '**INVALID MOVE***' unless check
    check
  end
end

x = RPS.new
x.play
