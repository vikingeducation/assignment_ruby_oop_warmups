class TowerOfHanoi

  def initialize(rings)
    first_rod = []
    counter = rings
    while counter > 0
      first_rod << counter
      counter -= 1
    end
    @board = [first_rod.dup, [], []]
    @first_rod = first_rod
  end

  def render
    puts "Rod 1: #{@board[0]}"
    puts "Rod 2: #{@board[1]}"
    puts "Rod 3: #{@board[2]}"
  end

  def move(from, to)
    moved_piece = @board[from-1].pop
    @board[to-1] << moved_piece
  end

  def turn
    puts "Enter move:"
    print "> "
    position_change = gets.chomp
    if position_change == 'q'
      exit
    end
    change_array = position_change.split(",")
    if valid_move?(change_array[0].to_i, change_array[1].to_i) == true
      move(change_array[0].to_i, change_array[1].to_i)
      render
    else
      puts "Invalid move. Please try again."
      turn
    end
  end

  def valid_move?(from, to)
    if from == 0 || to == 0
      false
    elsif @board[from-1].empty?
      false
    elsif @board[to-1].empty?
      true
    elsif @board[from-1].last < @board[to-1].last
      true
    else
      false
    end
  end

  def won?
    if @board == [[],@first_rod,[]] || @board == [[],[],@first_rod]
      true
    else
      false
    end
  end

  def play
    puts "Welcome to Tower of Hanoi!"
    puts "Instructions:"
    puts "Enter where you'd like to move from and to in the format '1,3'. Enter 'q' to quit."
    puts "Current Board:"
    render
    until won? == true
      turn
    end
    puts "Congratulations! You did it!"
  end

end