class TowersOfHanoi
  def initialize(number_of_disks)
    @disks = number_of_disks
    @board = {
      :left => first_stack,
      :center => [],
      :right => []
    }
  end

  def first_stack
    (1..@disks).to_a.reverse
  end

  def print_instructions
    puts "*******************************************"
    puts "Welcome to Tower of Hanoi!"
    puts "Instructions:"
    puts "Enter where you'd like to move from and to"
    puts "in the format 1,3 Enter 'q' to quit."
    puts "*******************************************"
  end

  def render
    puts "Current board:"
    level = 1
    while level <= @disks
      print_tier(@board[:left], level)
      print_tier(@board[:center], level)
      print_tier(@board[:right], level)
      print "\n"
      level += 1
    end
    3.times do |num|
      print "-#{num+1}-" + (" " * @disks)
    end
    print "\n"
  end

  def print_tier(column, row)
    disks_in_this_position = column[@disks-row].to_i
    print "o" * disks_in_this_position
    print " " * (@disks*2 - disks_in_this_position)
  end

  def play
    print_instructions #prints instructions
    render #prints initial board
    end_game = false

    until end_game #play loop
      is_valid = false
      until is_valid #loops until valid input
        print "Enter your move: "
        input = gets.chomp #asks for input
        return nil if input == "q" #quit option
        move = input.split(",").map(&:to_i) #turns input into workable array
        is_valid = is_input_valid?(move) #checks input validity
      end
      perform_move(num_to_sym(move[0]), num_to_sym(move[1]))
      render #prints modified board
      end_game = has_won?
    end

    puts "Congratulations! You beat the tower!"
    play if play_again?

    puts "Play again later! Goodbye."
  end

  def play_again?
    is_valid = false
    until is_valid
      print "Do you want to play again? (Y/N): "
      input = gets.chomp.downcase
      is_valid = is_yes_or_no?(input)
      puts "Try 'y' or 'n'" unless is_valid
    end
    return input == "y"
  end


  def is_yes_or_no?(input)
    ["y", "n"].include?(input)
  end

  def has_won?
    @board[:center].length == @disks || @board[:right].length == @disks
  end

  def num_to_sym(num)
    if num == 1
      return :left
    elsif num == 2
      return :center
    else
      return :right
    end
  end

  def is_input_valid?(move)
    move.length == 2 && move.all? {|number| [1,2,3].include?(number)}
  end

  def perform_move(from, to)
    @board[to].push(@board[from].pop)
  end


end