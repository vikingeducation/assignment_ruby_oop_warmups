
# need to add 2 player mode

class RockPaperScissors
  def initialize
    @options = ["rock", "paper", "scissors"]
    @bot_pick = @options.sample
    puts "Welcome to rock, paper, scissors\n"
    choose
  end

  def choose
    puts "\nPlease enter which option you'd like to pick\n\n"
    @player_pick = gets.chomp
    validatey
  end

  def validatey
    if @player_pick == "rock" || @player_pick == "paper"
      judge
    elsif @player_pick == "scissors"
      judge
    else
      puts "\nPlease enter one of the following options\nrock\npaper\nscissors"
      choose
    end
  end

  def judge
    @win = false
    if @player_pick == "rock" && @bot_pick == "scissors"
      @win = true
    elsif @player_pick == "paper" && @bot_pick == "rock"
      @win = true
    elsif @player_pick == "scissors" && @bot_pick == "papper"
      @win = true
    elsif @player_pick == @bot_pick
      @win = "tie"
    end
    results
  end

  def results
    if @win == true
      puts "\nYou won with #{@player_pick} against #{@bot_pick}!"
    elsif @win == "tie"
      puts "\nYou tied with #{@player_pick} against #{@bot_pick}."
    elsif @win == false
      puts "\nThe bot won with #{@bot_pick} against your #{@player_pick}."
    end
  end

end

RockPaperScissors.new






















# spacing
