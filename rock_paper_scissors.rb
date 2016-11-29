class RockPaperScissors

def initialize
  @player1_move = player1_move
  @computer_move = computer_move
  @choices = %w(rock, paper, scissors)
end

def play_game
  puts "Ready to play?"
  gets
  player_throw
  computer_throw
  evaluate
end

def player_throw
  until @choices.include?(@player1_move) 
    puts "Rock, paper, scissors..."
    print ">"
    @player1_move = gets.chomp.downcase.gsub(/\s+/, "")
    puts "Sorry, that's not a valid move" unless choices.include?(@player1_move)
  end
end

def computer_throw  
  @computer_move = @choices.sample
end

def evaluate
  evaluation_array << @player_throw
  evaluation_array << @computer_throw

end





#class ends here
end