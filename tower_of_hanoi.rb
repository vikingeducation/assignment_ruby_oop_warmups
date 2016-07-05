class TowerOfHanoi

#instance variables: 
# => board
# => first_rod

#methods:
# => play
# => turn
# => render
# => valid_move
# => move
# => win

  def initialize(no_of_discs) 
    @first_rod = []
    counter = 1
    while counter <= no_of_discs 
      @first_rod.unshift(counter)
      counter += 1
    end
    @board = [ @first_rod,[],[] ]
  end

  def play 
    puts "Welcome to Tower of Hanoi!"
    render
    until win?
      turn
      render
    end
  end

  def render
    # multiply integer of disc by letter o
    # final line use left-justify and center-justify methods
    # string.ljust(line-width), rjust
    counter = @first_rod.length
    line_width = 60
    while counter > 0
        # if @board[0][counter] == nil
      col1 = "#{"o" * @board[0][counter]}"
      col2 = "#{"o" * @board[1][counter]}"
      col3 = "#{"o" * @board[2][counter]}"
      puts col1.ljust(line_width/3) + col2.center(line_width/3) + col3.rjust(line_width/3)
      counter -= 1
    end
    puts "1".ljust(line_width/3) + "2".center(line_width/3) + "3".rjust(line_width/3)
    #smallest discs are on the right side of the array
  end

  def win?
    if @board[1] == @first_rod || @board[2] == @first_rod
      puts "Congratulations, you've won!"
      return true
    else 
      return false
    end
  end

  def move(from, to)
    @board[to-1] << @board[from-1].pop if valid_move?(from, to)
  end

  def valid_move?(from, to)
    if @board[from-1].empty?
      return false
    elsif @board[to-1].empty?
      return true
    elsif @board[to-1][-1] > @board[from-1][-1]
      return true
    else
      return false
    end
  end

  def turn
    user_input = gets.chomp
    user_input = user_input.split(",")
    from = user_input[0].to_i
    to = user_input[1].to_i
    move(from, to)
  end

end












