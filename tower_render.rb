class RenderTower

  def pickup_line
    puts "Where would you like to pick up a plate from?(\#1-3)"
  end

  def pickup_error 
    "No plates in that location"
  end

  def putdown_line
    puts "Where would you like to move a plate to?(\#1-3)"
  end

  def putdown_error
    puts "Plates can only be stacked on larger plates"
  end

  def welcome_message stack_size
    puts "\n\nWELCOME TO THE TOWER OF HANOI\n"
    puts "To play the game start by entering the column of the plate you want to move,"
    puts "then select where you want to move it to."
    puts "You win the game by moving all plates to column 3\n\n"
    puts "type \"quit\" at any time to exit the game"
    puts "\n\nPlaying with #{stack_size} plates"
  end



  # Create the display grid and then display it
  def render gameboard, stack_size
    grid = render_grid (gameboard, stack_size)
    print "\n\n"
    render_visual (grid, stack_size)
    print "\n\n"
  end

  private
  # Fill blank space in the grid
  def render_grid gameboard, stack_size
    grid_rows = Array.new(stack_size){[]}
    stack_size.times do |row|
      gameboard.each do |column|
        grid_rows[row] << column[row]
      end
    end
    grid_rows.reverse
  end

  # Display disk stacks
  def render_visual grid, stack_size 
    grid.each do |row|
      row.each do |cell|
        cell = cell || 0
        print "#{' '*(stack_size+1-cell)}#{'##'*cell}#{' '*(stack_size+1-cell)} | "
      end
      print "\n"
    end
    puts "#{'-'*6*(stack_size+2)}-"
    (1..3).each {|num| print "#{' '*stack_size}0#{num}#{' '*stack_size}   "}
    nil
  end

end