class Towers
  @towers
  @num_disks

  def initialize(num_disks)
    @towers = [[],[],[]]
    @num_disks = num_disks
    num_disks.times { |i| @towers[0].push(num_disks - i) }
  end

  def render()
    @num_disks.downto(1) do |i|
      3.times do |j|
        disk = @towers[j][i - 1]
        unless disk
          print " " * @num_disks
          print "||"
          print " " * @num_disks
        else
          print " " * (@num_disks - disk)
          print "("
          print " " * (disk - 1)
          print "  "
          print " " * (disk - 1)
          print ")"
          print " " * (@num_disks - disk)
        end
      end
      print "\n"
    end
    print "_" * (((@num_disks * 2) + 2) * 3) + "\n"
  end

  def play()
    puts "Welcome to the Tower of Hanoi!"
    puts "Here are your towers:"
    render()
    result = true
    loop do
      result = handle_input()
      break unless result
      move_disk(result[:from], result[:to])
      render()
      if check_victory?
        puts "Congratulations! You win!"
        break
      end
    end
  end

  def check_victory?()
    @towers[2].length == @num_disks && @towers[2].sort.reverse == @towers[2]
  end

  def handle_input()
    check = /^\s*(?<from>\d)\s*,\s*(?<to>\d)\s*/
    moves = {}
    loop do
      puts "Please enter the move you'd like from and to"
      puts "in the format '1, 3'. Enter 'q' to quit."
      input = gets.chomp
      return false if input == "quit" || input == "q"
      moves = check.match(input)
      break if moves
    end
    return moves
  end

  def valid_move?(from, to)
    if from == to
      return false
    elsif @towers[from.to_i - 1].length == 0
      return false
    elsif @towers[to.to_i - 1].last && @towers[from.to_i - 1].last > @towers[to.to_i - 1].last
      return false
    else
      return true
    end
  end

  def move_disk(from, to)
    if valid_move?(from, to)
      @towers[to.to_i - 1].push(@towers[from.to_i - 1].pop)
    else
      puts "Invalid Move"
    end
  end

end
