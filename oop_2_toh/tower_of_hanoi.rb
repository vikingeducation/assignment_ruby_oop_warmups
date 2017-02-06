require_relative 'rod.rb'
require_relative 'disk.rb'

class TowerOfHanoi
  def initialize(disk_count=3)
    @rods = [Rod.new, Rod.new, Rod.new]
    @disk_count = disk_count
  end

  # TODO - Refactor new_game method
  def new_game
    reset_board
    instructions
    render
  end

  def reset_board
    3.times { |i| @rods[i].reset }

    i = @disk_count
    while i > 0 do
      @rods[0].push(Disk.new(i))
      i -= 1
    end
  end

  def instructions
    puts "\nWelcome to Tower of Hanoi!\n\n"
    puts "Instructions:\n\n"
    puts "Enter where you'd like to move from and to"
    puts "in the format '1,3'. Entesr 'q' to quit."
  end

  def move_disk(entry)
    from = entry[0].to_i - 1
    to = entry[2].to_i - 1

    disk = @rods[from].pop
    @rods[to].push(disk)
  end

  def win?
    winning_sequence = []

    @disks.downto(1) do |i|
      winning_sequence.push(Disk.new(i))
    end

    @rods[1] == winning_sequence || @rods[2] == winning_sequence ? true : false
  end

  def invalid_entry
    puts "Please enter a valid input."
  end

  def play_again?
    puts "Congratulations! Would you like to play again?"
    puts "Enter 'y' to play again or 'q' to quit."
    entry = gets.chomp()

    if entry == "q"
      return false
    elsif entry == "y"
      return true
    else
      invalid_entry
      play_again?
    end
  end

  def quit?(entry)
    entry == "q"
  end

  def play
    new_game

    until win?
      user_move
      render
    end

    play_again? ? play : exit
  end

  # TODO - Refactor render methods
  #### Render methods
  def render
    puts "Rod One:"
    @rods[0].render
    puts "Rod Two:"
    @rods[1].render
    puts "Rod Three:"
    @rods[2].render
  end

  # TODO - Refactor valid_move? method
  def valid_move?(entry)
    from = entry[0].to_i - 1
    to = entry[2].to_i - 1

    return false unless /[1-3,1-3]/.match(entry)
    return false if from == to
    return false if @rods[from] == []

    if @rods[to] != []
      return false if @rods[to][-1] < @rods[from][-1]
    end

    true
  end

  # TODO - Refactor user_move method
  def user_move
    print "Enter move: "
    entry = gets.chomp()

    if quit?(entry)
      exit
    elsif valid_move?(entry)
      move_disk(entry)
    else
      invalid_entry
      user_move
    end
  end

end

a = TowerOfHanoi.new
a.play
