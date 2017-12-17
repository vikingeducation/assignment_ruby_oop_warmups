
=begin
  Documents/Viking/Ruby/oop_warmups

  require 'pry'
  binding.pry

=end

class RockPaperScissors
  def initialize
    @options = ["rock", "paper", "scissors"]
    @p2_pick = @options.sample
    @p1_win, @p2_win = false, false
    system "cls"
    system "clear"
    puts "\nWelcome to rock, paper, scissors\n"
    mode
  end

  def mode
    puts "\nPlease enter 1 to start a single player session or 2 for a two player game.\n\n"
    @mode = gets.chomp
    check_mode
  end

  def check_mode
    if @mode == "1"
      @mode = 1
      choose
    elsif @mode == "2"
      @mode = 2
      choose
    else
      puts "\nSomething went wrong, try choosing the number of players again."
      mode
    end
  end

  def choose
    if @mode == 1
      puts "\nPlease enter which option you'd like to pick\n\n"
      @p1_pick = gets.chomp
    else
      @p1_pick = @options.sample
      puts "\nSince the second player could simply pick the winning option everytime\nin all fairness you've both been assigned a random option."
      puts "\nPlayer one got #{@p1_pick}, and player two got #{@p2_pick}."
    end
    valid_choice
  end

  def valid_choice
    if !@options.include?(@p1_pick)
      puts "\nPlease enter one of the following options\nrock\npaper\nscissors"
      choose
    else
      judge
    end
  end

  def judge
    if @p1_pick == "rock" && @p2_pick == "scissors"
      @p1_win = true
    elsif @p1_pick == "paper" && @p2_pick == "rock"
      @p1_win = true
    elsif @p1_pick == "scissors" && @p2_pick == "paper"
      @p1_win = true
    elsif @p1_pick == @p2_pick
      @p1_win = "tie"
    else
      @p2_win = true
    end
    results
  end

  def results
    @mode == 1 ? p2 = "The computer" : p2 = "player two"
      if @p1_win == true
        puts "\nPlayer one is the winner with #{@p1_pick} against #{@p2_pick}!"
      elsif @p1_win == "tie"
        puts "\nThe result is a tie with player one's #{@p1_pick} against #{p2}'s #{@p2_pick}."
      else
        puts "\n#{p2} won with #{@p2_pick} against #{@p1_pick}!"
      end
  end
end

RockPaperScissors.new
