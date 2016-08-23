class Disc

  attr_accessor :width

  def initialize(width)
    @width = width
  end

end


class Tower < Array

  attr_reader :height, :stack

  def initialize(num_discs)
    @num_discs = num_discs
    @stack = []
    add_discs
  end

  def add_discs
    disc_num = @num_discs
    until disc_num == 0
      @stack << Disc.new(disc_num).width
      disc_num -= 1
    end
  end

  def height
    @stack.size
  end

end


class Visualization

  def initialize(current_board, total_discs, moment = "current")
    @current_board = current_board
    @total_discs = total_discs
    @moment = moment
    @col_width = total_discs * 2 + 2
    render_board
  end

  def blank_line?(index)
    @current_board.values.all? { |discs| discs[index] == nil }
  end

  def visual_padding
    print "\n"
  end

  def print_spaces(num, type)
    if type == "disc" 
      spaces = (@col_width - num.to_i * 2) / 2
    else
      spaces = (@col_width - 8) / 2
    end
    spaces.times { print " " }
  end

  def print_content(num, type)
    if type == "disc"
      num.to_i.times { print "<>" }
    else
      print "Tower 0#{num}"
    end
  end

  def print_main(num, type = "disc")
    print_spaces(num, type)
    print_content(num, type)
    print_spaces(num, type)
  end

  def render_board
    puts "Here is the #{@moment} state of the board:\n\n"
    index = @total_discs - 1
    until index < 0
      unless blank_line?(index)
        @current_board.each { |num, discs| print_main(discs[index])}
      end
      visual_padding
      index -= 1
    end
    @current_board.each { |num, discs| print_main(num, "name") }
    2.times { visual_padding }
  end

end


class Game

  def initialize(total_discs)
    @total_discs = total_discs
    @current_board = {}
    @move_num = 0
    @full = []
    @from = 0
    @to = 0
    setup_board
  end

  def setup_board
    tower_one = Tower.new(@total_discs).stack
    tower_two = Tower.new(0).stack
    tower_three = Tower.new(0).stack
    @current_board = { "1" => tower_one, "2" => tower_two, "3" => tower_three }
    @full = tower_one.dup
  end

  def play
    until won?
      Visualization.new(@current_board, @total_discs)
      prompt_move(@move_num)
      get_move
      make_move
      @move_num += 1
    end
    Exit.new("won", @current_board, @total_discs, @move_num) if won?
  end
  
  def prompt_move(move_num)
    print "Enter where you'd like to move in the format 'from, to'."
    if move_num == 0
      print " For example, enter the digits '1' and '3' to move a disc from Tower 1 to Tower 3. Enter 'q' if you want to quit the game at any time. For further instructions on how to play TOH, google that sh*t."
    end
    print "\n"
  end

  def get_move
    print "> "
    input = gets.strip.downcase
    sift_input(input)
  end

  def sift_input(input)
    if input.empty?
      puts "(..type something!)"
      get_move
    elsif quit?(input)
      Exit.new("quit", @current_board, @total_discs, @move_num)
      exit
    else
      process_input(input)
    end
  end

  def process_input(input)
    move = input.split("")
    move.reject! {|item| item =~ /\D/}
    move = move + move if move.length == 1
    @from = move[0]
    @to = move[1]
  end

  def make_move
    until valid_move?
      puts "Invalid move, please try again."
      get_move
    end
    @current_board[@to] << @current_board[@from].pop
  end

  def proper_input?
    ["1", "2", "3"].include?(@from) &&
    ["1", "2", "3"].include?(@to) &&
    @to != @from
  end

  def disc_available?
    !@current_board[@from].empty?
  end

  def within_rules?
    @current_board[@to].empty? || 
    @current_board[@to][-1] > @current_board[@from][-1]
  end

  def valid_move?
    proper_input? && disc_available? && within_rules?
  end

  def quit?(input)
    input[0] == "q"
  end

  def won?
    @current_board["2"] == @full || @current_board["3"] == @full
  end

end


class Exit

  def initialize(circumstances, current_board, total_discs, move_num)
    @final_board = current_board
    @total_discs = total_discs
    @total_moves = move_num
    circumstances == "won" ? won : quit
  end

  def play_again?(answer)
    answer[0] == "y"
  end

  def quit
    puts "Alright, quitting after #{@total_moves} moves. Come play again soon!"
  end

  def won
    puts "YOU WON in #{@total_moves} moves! Nice job."
    Visualization.new(@final_board, @total_discs, "final")
    puts "Do you want to play again? Y/N"
    answer = gets.strip.downcase
    if play_again?(answer)
      puts "Alright, let's do this!"
      new_game
    else
      puts "I'll take that as a no. Come back soon!"
    end
  end

end


def new_game
  puts "How many discs would you like to play with?"
  total_discs = gets.strip.to_i
  until total_discs > 2 && total_discs < 31
    puts "Please choose a number between 3 and 30."
    total_discs = gets.strip.to_i
  end
  puts "Initializing play with #{total_discs} discs..."
  game = Game.new(total_discs)
  game.play
end

puts "Welcome to Towers of Hanoi!"
new_game