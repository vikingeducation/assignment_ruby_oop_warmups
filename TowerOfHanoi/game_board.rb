

class GameBoard
  def initialize(disks)
    @num_disks = disks
    @moves = 0
    @new_move = { start: 0, finish: 0 }
    @stacks = [[], [], []]
    disks.downto(1) { |disk| @stacks[0].push(disk) }
  end

  def render
    puts "\nAfter #{@moves} moves: "
    @num_disks.downto(0) do |num|
      @stacks.length.times do |stack|
        num >= @stacks[stack].length ? print('|'.center(5)) : print(@stacks[stack][num].to_s.center(5))
      end
      puts "\n"
    end
  end

  def instructions
    puts "Welcome to Tower of Hanoi with #{@num_disks} disks.\n\n"
    puts "Instructions for play: "
    puts "Enter a move in the format 'from,to' at the prompt or Q to the quit."
    puts "For example, entering '1,3' will move the top disk from stack 1 to stack 3.\n\n"
    puts "The current board looks like: "
    render
  end

  def won?
    @stacks[2].length == @num_disks ? (return true) : (return false)
  end

  def move
    input_player_move
    puts "valid #{valid_input?}"
    return puts("\n*** Invalid move ***") unless valid_input? && valid_move?

    @stacks[@new_move[:finish]].push(@stacks[@new_move[:start]].pop)
    @moves += 1
  end

  private

  def input_player_move
    puts 'Enter your move: '
    player_input = gets.strip.upcase.split(',')

    if player_input == 'Q'
      puts "\n\nThanks for playing!"
      exit
    end

    @new_move[:start] = player_input[0].to_i - 1
    @new_move[:finish] = player_input[1].to_i - 1
  end

  def valid_input?
    return false unless @new_move[:start].to_s =~ /[012]/ && @new_move[:finish].to_s =~ /[012]/
    true
  end

  def valid_move?
    @stacks[@new_move[:start]].empty? ? (return false) : from_top_disk = @stacks[@new_move[:start]][-1]
    @stacks[@new_move[:finish]].empty? ? to_top_disk = @num_disks**2 : to_top_disk = @stacks[@new_move[:finish]][-1]

    from_top_disk < to_top_disk ? (return true) : (return false)
  end
end
