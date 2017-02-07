require_relative 'rod.rb'
require_relative 'disk.rb'

class TowerOfHanoi
  def initialize(disk_count=3)
    @rods = [Rod.new, Rod.new, Rod.new]
    @disk_count = disk_count
  end

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
    puts "in the format '1,3'. Enter 'q' to quit."
  end

  def move_disk(entry)
    from = entry[0].to_i - 1
    to = entry[2].to_i - 1

    disk = @rods[from].pop
    @rods[to].push(disk)
  end

  def win?
    if @rods[1].count == @disk_count
      true
    elsif @rods[2].count == @disk_count
      true
    else
      false
    end
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

  def valid_move?(entry)
    from = entry[0].to_i - 1
    to = entry[2].to_i - 1

    return false unless /[1-3,1-3]/.match(entry)
    return false if from == to
    return false if @rods[from].count == 0

    if @rods[to].count > 0
      return false if @rods[to].top_disk.size < @rods[from].top_disk.size
    end

    true
  end

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

  #### Render methods
  def render
    line_width = 7 + (@disk_count - 3) * 2
    margin = 3 + (@disk_count - 3)

    @disk_count.downto(0) do |row|
      3.times do |rod|
        @rods[rod].render(line_width, row)
        render_margin(margin)
        puts if rod == 2
      end
    end

    render_base(line_width, margin)
  end

  def render_margin(margin)
    print " " * margin
  end

  def render_base(line_width, margin)
    dash_padding = (line_width - 3) / 2

    i = 1
    3.times do
      print "-" * dash_padding
      print " #{i} "
      print "-" * dash_padding
      print " " * margin unless i == 3
      i += 1
    end

    print "\n\n"
  end

end