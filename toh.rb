class TowerOfHanoi

  #initialize initial stack height
  def initialize(num_disks)
    @disk = num_disks
  end

  def play
    #Prints intro
    puts
    puts "Welcome to Tower of Hanoi!"
    puts
    puts "Instructions:"
    puts "Enter where you'd like to move from and to"
    puts "in the format [1,3]. Enter 'quit' to end."
    puts

    #initialize first tower
    board = []
    #Fill left column with disk numbers
    (1..@disk).each do |x|
      board.push(@disk - x + 1)
    end
    #initialize other towers
    board = [board, [], []]

    catch(:quit) do
      #game loop
      until win?(board)
        #print current state
        render(board)
        #check valid user inputs
        is_valid = false
        until is_valid
          print "Make a move:"
          move = gets.chomp
          puts
          if "quit" == move
            throw(:quit)
          elsif valid_input?(move)
            is_valid = true
          else
            puts "NOT VALID INPUT"
          end
        end
        #moves the disk and update board
        board = process_move(move, board)
      end
    end

    #Print out victory condition
    puts "you won!" if win?(board)
  end

  #checks for win condition
  def win?(state)
    #initialize win 2D array state
    win_board = []
    #Fill right column with disk numbers
    (1..@disk).each do |x|
      win_board.push(@disk - x + 1)
    end
    win_board = [[], [], win_board]
    return state == win_board
  end

  #checks for valid user inputs
  def valid_input?(user_input)
    #use REGEX to check for proper inputs
    proper_input = /\[[123],[123]\]/
    if proper_input.match(user_input.to_s)
      return true
    else
      return false
    end
  end

  #prints board state
  def render(state)
    puts "Current Board:"
    puts
    #prints disks
    (2.downto(0)).each do |x|
      disp_column = state.map { |row| row[x] }
      disp_column.each do |y|
        if y.is_a? Integer
          disk_print = "o" * y
        else
          disk_print = ""
        end

        print disk_print.ljust(@disk + 2, " ")
      end
      puts
    end
    puts

    #prints tower numbers
    state.each_with_index do |value, index|
      print (index + 1).to_s.ljust(@disk + 2, " ")
    end
    print "\n\n"
  end

  #processes disk user move
  def process_move(move, state)
    from = move[1].to_i - 1
    to = move[3].to_i - 1

    #check if there's a disk to move
    if state[from].first == nil
      puts "There's no disk in tower #{from + 1}!"
    #check if destination tower has space
    elsif state[to].length == @disk
      puts "Tower #{to + 1} is at full capacity!"
    #check if "from" disk is smaller than "to" disk
    elsif state[to].last != nil && state[from].last > state[to].last
      puts "This disk is larger than the destination disk! Illegal move!"
    #otherwise proceed to move the plates
    else
      state[to].push(state[from].last)
      state[from].pop
    end

    return state
  end
end

#Run the game for test purposes
t = TowerOfHanoi.new(3)
t.play
