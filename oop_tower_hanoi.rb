class Tower

  def initialize(height)
    @height = height
    @board = [(@height.downto(1)).to_a,[],[]]
  end

  def check_for_win?
    #checks 3rd tower for winning condition
    if @board[2] == (@height.downto(1)).to_a
      return true
    else
      return false
    end
  end

  def render

    vert = @height-1 #height index to iterate from
    col_width = @height + 1

    puts "Current Board:"

    (@height-1).downto(0) do |vert|
      (0..2).each do |horiz| #iterate thru towers
        if @board[horiz][vert] == nil
          print "\s"*col_width
        else
          print "o"*@board[horiz][vert]
          (col_width - @board[horiz][vert]).times {print "\s"}
        end
      end
      print "\n"
    end
    #print tower number at bottom of board
    (1..3).each {|tower| print tower.to_s  + "\s"*(col_width-1)}
    puts

  end



  def move(move_from, move_to)
    @board[move_to-1] << @board[move_from-1].pop
    return @board
  end

  def valid_move?(move_from, move_to)
    #check for trying to move from empty tower
    if @board[move_from-1][-1] == nil
      return false
      #check for valid tower number
    elsif !move_from.between?(1,3)
      return false
    elsif !move_to.between?(1,3)
      return false
      #check for trying to move to empty tower
    elsif @board[move_to-1][-1] == nil
      return true
      #check for move to a non-empty tower
    elsif @board[move_from-1][-1] < @board[move_to-1][-1]
      return true
    else
      return false
    end
  end
end


def play

  #validate input
  valid_height = false
  while !valid_height
    puts 'Thanks for playing Towers of Hanoi'
    puts 'How high would you like the towers to be?'
    print '> '

    height = gets.chomp.to_i
    if height.is_a?(Integer) && height >=1
      valid_height = true
    end
  end

  tower = Tower.new(height)

  #play until user quits or wins
  loop do
    #show board
    tower.render

    #get move
    puts "Enter your move or enter 'q' to quit"
    print '> '
    input = gets
    if input.chomp.downcase == 'q'
      puts "Bye!"
      exit
    else
      move_from, move_to = input.split(/,/).map(&:to_i)

      if !tower.valid_move?(move_from, move_to)
        puts "Invalid Move"
      else
        tower.move(move_from, move_to)
        if tower.check_for_win?
          tower.render
          puts "You Win!"
          exit
        end
      end
    end
  end #end loop
end #end play

play
