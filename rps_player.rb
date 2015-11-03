require 'io/console'

class RPSPlayer
  attr_accessor :move, :name

  @@valid_answers = ['r', 'p', 's']

  def initialize
    puts "Welcome, new player!  What's your name?"
    print " > "
    @name = gets.chomp.capitalize
  end

  def select_move
    puts "#{@name}, what's your move? (r = rock, p = paper, s = scissors)"
    puts "Note that your input is HIDDEN!"
    print " > "
    @move = validate STDIN.noecho(&:gets).chomp
  end

  def validate input
    if @@valid_answers.include? input
      input
    else
      puts "I'm sorry, that's not a valid move.  Try again..."
      select_move
    end
  end
end