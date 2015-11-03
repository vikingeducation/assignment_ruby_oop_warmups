class RockPaperScissor
  # attr_accessor :player_move

  @@valid_answers = ['r', 'p', 's']

  def initialize mode="AI"
    puts "Welcome to Rock, Paper, Scissors!"
    @mode = mode
  end

  def play
    @computer_move = @@valid_answers.shuffle.first
    @player_move = player_input
    if @player_move == @computer_move
      puts "It's a draw!  Let's try again!"
      play
    elsif player_win?
      puts "YOU WIN!!  Your #{@player_move} beat #{@computer_move}."
    else
      puts "Sorry, #{@computer_move} beat your #{@player_move}."
    end
  end

  def player_input
    puts "What's your move? (r = rock, p = paper, s = scissors)"
    validate gets.chomp.to_s
  end

  def validate input
    if @@valid_answers.include? input
      input
    else
      puts "I'm sorry, that's not a valid move.  Try again..."
      player_input
    end
  end

  def player_win?
    winners = [['r', 's'], ['p', 'r'], ['s', 'p']]
    winners.include? [@player_move, @computer_move]
  end

end