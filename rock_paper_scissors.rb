class RockPaperScissors
  def initialize
    @options = ["rock", "paper", "scissors"]
    @computer = @options[rand(2)]
    play
  end

  def play
    puts "Enter rock, paper, or scissors"
    @pick = gets.chomp.downcase
    compare
  end

  def compare
    puts @computer
    puts @pick
  end
end

game = RockPaperScissors.new