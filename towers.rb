class TowersOfHanoi
  def initialize(number_of_disks)
    @disks = number_of_disks
    @board = {
      :left => first_stack,
      :center => [],
      :right => []
    }
  end

  def first_stack
    (1..@disks).to_a.reverse
  end

  def print_instructions
    puts "*******************************************"
    puts "Welcome to Tower of Hanoi!"
    puts "Instructions:"
    puts "Enter where you'd like to move from and to"
    puts "in the format 1,3 Enter 'q' to quit."
    puts "*******************************************"
  end

  def render
    puts "Current board:"
    puts @board
  end

  #Print visual render of the board
  #Ask for move
  #Perform the move
  #Check if player won
    #If yes ask to play again
    #Otherwise render board and ask for move...


end