class RockPaperScissors
  def initialize
    @options = {"rock" => {lose: "paper", win: "scissors", value: "rock"}, 
      "paper" => {lose: "scissors", win: "rock", value: "paper"}, 
      "scissors" => {lose: "rock", win: "paper", value: "scissors"}
    }
    play
  end

  def valid?
    
  end

  def play
    puts "Welcome to rock-paper-scissors!"
    puts "Play with two players? (yes/no)"
    until valid?
      @players = gets.chomp.downcase
    end
  end

  def player2
    option_values = ["rock", "paper", "scissors"]
    @player2 = @options[option_values[rand(2)]]
  end

  def pick
    until @options.include? @pick
      puts "Enter \"rock\", \"paper\", or \"scissors\""
      @pick = gets.chomp.downcase
    end
  end

  def compare
    if @pick == @computer[:win]
      puts "#{@player2[:value]} beats #{@pick}... you lose!"
    elsif @pick == @computer[:lose]
      puts "#{@pick} beats #{@player2[:value]}... you win!"
    else
      @pick = ""
      puts "Tie Game"
      player2
      play
    end
  end
end

game = RockPaperScissors.new