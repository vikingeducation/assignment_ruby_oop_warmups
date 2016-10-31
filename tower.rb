class TowerOfHanoi
  def initialize size=4

    welcome_message
    
    create_gameplay size
    create_gameboard
    play
  end

  # def create_gameplay stack_size
    
  #   @stack_size = stack_size
  #   @turns = 0
  #   @best_possible = 2**@stack_size-1
  # end

  # def create_gameboard
  #   @gameboard = [[],[],[]]
  #   @stack_size.downto(1) {|plate| @gameboard[0] << plate}
  #   @goal = @gameboard[0].dup
  # end

  def move_piece plate, target
    @gameboard[target-1] << @gameboard[plate-1][-1]
    @gameboard[plate-1].pop
  end

  def movement compare=false
    yield(false)
    rod = gets.chomp
    quit(rod)
    until valid?(rod, compare)
      render
      yield(true)
      rod = gets.chomp
    end
    return rod.to_i
  end

  def play
    render
    until win?
      take_turn
      render
    end
    won
  end

  # # Create the display grid and then display it
  # def render
  #   grid = render_grid
  #   print "\n\n"
  #   render_visual grid
  #   print "\n\n"
  # end

  # # Fill blank space in the grid
  # def render_grid
  #   grid_rows = Array.new(@stack_size){[]}
  #   @stack_size.times do |row|
  #     @gameboard.each do |column|
  #       grid_rows[row] << column[row]
  #     end
  #   end
  #   grid_rows.reverse
  # end

  # # Display disk stacks
  # def render_visual grid    
  #   grid.each do |row|
  #     row.each do |cell|
  #       cell = cell || 0
  #       print "#{' '*(@stack_size+1-cell)}#{'##'*cell}#{' '*(@stack_size+1-cell)} | "
  #     end
  #     print "\n"
  #   end
  #   puts "#{'-'*6*(@stack_size+2)}-"
  #   (1..3).each {|num| print "#{' '*@stack_size}0#{num}#{' '*@stack_size}   "}
  #   nil
  # end

  def quit input
    exit if input == "quit"
  end

  def reset difficulty=0
    create_gameplay(@stack_size+difficulty)
    create_gameboard
    play
  end

  def take_turn
    plate, target= 0
    plate = movement do |error|
      puts "#{@pickup_error}\n\n" if error
      puts "\n#{@pickup_line} "
    end
    target = movement plate do |error|
      puts "#{@putdown_error}\n\n" if error
      puts "\n#{@putdown_line} "
    end
    if plate != target 
      move_piece plate, target
      @turns += 1
    end
  end

  def valid? location, size_check=false
    if (1..3).include?(location)
      if (size_check)
        return (!@gameboard[location-1][-1] || @gameboard[location-1][-1] >= @gameboard[size_check-1][-1])
      else
        return @gameboard[location-1][-1] != nil
      end
    end
  end

  # def welcome_message
  #   puts "\n\nWELCOME TO THE TOWER OF HANOI\n"
  #   puts "To play the game start by entering the column of the plate you want to move,"
  #   puts "then select where you want to move it to."
  #   puts "You win the game by moving all plates to column 3\n\n"
  #   puts "type \"quit\" at any time to exit the game"
  # end

  def win?
    @goal == @gameboard[2]
  end

  # def won
  #   puts "Congratulations, You won!\nYou completed the tower in #{@turns} moves."
  #   if @turns > @best_possible
  #     puts "There is a more efficient solution possible (#{@best_possible} moves)\nretry?"
  #     if gets.chomp == "yes" then reset end
  #   else
  #     puts "You completed the game in the least amount of turns possible!\nUp the difficulty?"
  #     if gets.chomp == "yes" then reset(1) end
  #   end
  # end
end

t = TowerOfHanoi.new