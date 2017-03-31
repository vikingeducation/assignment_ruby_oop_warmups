#Tower of Hanoi assignment
#user specifies hieght of tower
#goal is to move the entire tower from one rod to another rod with the following restrictions:
#you can  move only one disk at a time
#you can move only the top disk of any given stack
#you can stack only smaller disks on larger disks. a larger disk cannot be stacked on a smaller disk
class TowerOfHanoi

  def initialize(number_of_disks)
    @size_of_disks = number_of_disks
    @game_board = [[],[],[]] #3 rods
    @rods = [1,2,3]
    @moves = 0
    @disk_to_move = 0
    @from = 0
    @to = 0
    @error_message = "That is not a valid input, please try again (enter 1, 2, 3 or q to quit)"
  end


  #game board depends on number of disks specified by user, number of disks is the number of rows
  def game_board
    spaces = (@size_of_disks - 1)
    iterator = 1
    while iterator <= @size_of_disks do
      @game_board[0] << ("o" * iterator) + (" " * (@size_of_disks - iterator))
      iterator += 1
    end
    puts "Current board: "
    puts @game_board
    print @rods.join("      ")
  end


  #need method to render the board properly after moves have been made
  def render
    rows_to_be_rendered = []
    (1..@game_board.length).each do |i|
      row = []
      @game_board.each do |col|
        row << (col[-i] || " " * @size_of_disks)
      end
      rows_to_be_rendered << row.join(" ") + "\n"
    end
    rows_to_be_rendered.reverse.each do |rows_to_be_rendered|
      print rows_to_be_rendered
    end
    print @rods.join("      ") + "\n"
  end


  #get user move from input
  def get_user_move_from
    guess_again = true
    until guess_again == false
      puts "From which rod would you like to move a disk?"
      @from = gets.chomp
      case @from.downcase
      when "q"
        puts "Thank you for playing, have a great day!"
        exit
      when /[^1-3]/
        puts @error_message
        next
      when /[1-3]/
        @from = @from.to_i
        if @game_board[@from - 1][0] == nil
          puts @error_message
          next
        else
          guess_again = false
        end
      end
    end
  end


  #get user move to input
  def get_user_move_to
    guess_again = true
    until guess_again == false
      puts "And where would you like to move the disk it to?"
      @to = gets.chomp
      case @to.downcase
      when "q"
        puts "Thank you for playing, have a great day!"
        exit
      when /[^1-3]/
        puts @error_message
        next
      when /[1-3]/
        @to = @to.to_i
        if is_move_valid? == true
          guess_again = false
          return @to
        else
          puts "Your move was not valid please start move over"
          get_user_move_from
        end
      end
    end
  end


  #check if user input is valid before moving disks
  def is_move_valid?
    if @game_board[@to - 1][0] == nil
      return true
    elsif @game_board[@from - 1][0] < @game_board[@to - 1][0]
      return true
    else
      return false
    end
  end


  #how to move disks based on user input
  def move_disk
    @disk_to_move = @game_board[@from - 1][0]
    @game_board[@to - 1].unshift(@disk_to_move)
    @game_board[@from - 1].shift
  end


  #check to see when the game has been won
  def win?
    if (@game_board[1].length == @size_of_disks) || (@game_board[2].length == @size_of_disks)
      puts "You win!!"
      puts "You won in #{@moves} moves."
      return true
    else
      return false
    end
  end


  def play
    #instructions for user
    puts "Welcome to the Tower of Hanoi"
    puts "Instructions:"
    puts "Enter where you would like to move a disk from (either rod number 1, 2 or 3). "
    puts "Then enter where you would like to move that disk to (either rod number 1, 2, or 3). "
    puts "You can only move one disc at a time and you cannot place a larger disc on top of a smaller one. "
    puts "You have won the game once the entire tower is moved to a different rod or type q to quit"
    #display starting game board
    puts game_board
    #get user moves from and to location, move disks, render, repeat
    until win? == true do
      get_user_move_from
      get_user_move_to
      move_disk
      render
      @moves += 1
    end
  end #end of play

end #end of class

n = TowerOfHanoi.new(3)
n.play
