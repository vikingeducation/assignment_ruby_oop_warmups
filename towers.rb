# player starts the game (script), provides the initial height of the tower
# instructions are printed
# game board is printed with height specified by user
# user is prompted to enter a move 
# user is prompted to enter a move
# check for valid user input
# move a disk according to user input
# `render` method prints the current game board
# check if user has won, otherwise prompt user for another input
# continue to check for valid user input, move the disk, render the board, check if user has won, prompt for another input
# game exits when user enters `quit` or wins

require 'pry'


class Player


  def initialize
    @input_array = []
  end


  def user_input
    puts "\nEnter move >"
    input = gets.chomp
    if input == "q"
      puts "Okay, bye!"
      exit
    # regex for user input, accepts an array with 1, 2, or 3 only
    elsif input !~ /\[[123].[123]\]/
      print "Please enter a valid array"
      # prompt user for another input
      user_input
    else
      # `gets` returns a string, need to chop it into an array
      return @input_array = input[1..3].split(',').collect! {|n| n.to_i}
    end
  end

end




class TowerofHanoi


  attr_reader :height


  def initialize(height)
    @height = height
    @player = Player.new
  end



  def print_instructions
    puts "Welcome to Tower of Hanoi!",
    "Instructions:",
    "Enter where you'd like to move a disk from and to",
    "in the format [1,3]. Enter 'q' to quit."
  end


  def make_gameboard(height=3)
    towera = (1..height).to_a.reverse
    towerb = []
    towerc = []
    gameboard = [towera, towerb, towerc]
    print gameboard
    return gameboard
  end


  def valid_move?(gameboard, input_array)
    from_column = (input_array[0]-1)
    to_column = (input_array[1]-1)
    # condition 1: from_column ring is empty
    if gameboard[from_column].empty?
      print "You cannot move disks from empty towers. Try again."
      false
    # condition 2: can't stack a larger disk on a smaller disk
    elsif ! gameboard[to_column].empty? && (gameboard[from_column].last > gameboard[to_column].last)
      print "to_column.last:", gameboard[to_column].last
      print "from_column.last:", gameboard[from_column].last

      print "You cannot stack larger disks on smaller disks. Try again."
      false
    else
      true
    end
  end


  def move_disk(gameboard, input_array)
    from_column = (input_array[0]-1)
    to_column = (input_array[1]-1)
    disk = gameboard[from_column].pop
    gameboard[to_column].push(disk)
    print gameboard
    return gameboard
  end


  def winning_tower?(gameboard)
    winning_tower = (1..@height).to_a.reverse
    gameboard.include? winning_tower
  end




  def play
    print_instructions
    gameboard = make_gameboard(@height)
    player_move = @player.user_input


    loop do
      # this is still buggy, user has to type correct moves twice
      if valid_move?(gameboard, player_move)
        
        new_gameboard = move_disk(gameboard, player_move)

        if winning_tower?(new_gameboard) == true
          print "\nCongratulations, you win!"
          return
        else
          gameboard = new_gameboard
        end

      else
        player_move = @player.user_input
      end


    end

  end



end





# t = TowerofHanoi.new(2)
# t.play

