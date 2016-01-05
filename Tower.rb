require_relative 'Player.rb'
require_relative 'Board.rb'

class TowerofHanoi

  def initialize
    @board = Board.new
    @player = Player.new
  end

  #greetings and instructions
  def greetings
    puts "********************************************************"
    puts "Welcome to Tower of Hanoi!".center(55)
    puts "Enter where you would like to move from and to".center(55)
    puts "in the format [1,3]. Enter 'q' to quit.".center(55)
    puts "********************************************************"
  end

   #check to see if move is legal in accordance to the rules
  def move_valid?
    @board.first_disk = 0

    #determine disk piece to be moved
    @board.board.each do |row, arr|
      if arr[@player.from] != 0
        @board.first_disk = arr[@player.from]
        break
      end
    end

    #determine the highest disk available in that column
    @board.board.each do |row, arr|
            if arr[@player.to] != 0
                @board.second_disk = arr[@player.to]
                break
            else
                @board.second_disk = arr[@player.to]
            end
        end

        #conditional test to see if move is valid
        if @board.first_disk == 0
            puts "No disks in this column, try again"
            get_input
        elsif @board.second_disk == 0 || @board.first_disk < @board.second_disk
            move_disk
        else
            puts "Move is invalid"
            puts "Please check the rules and input a new move"
            get_input
        end
  end 

    #make move
  def move_disk
        @board.disks.downto(1).each do |idx|
            if @board.board[idx][@player.to] == 0
                @board.board[idx][@player.to] = @board.first_disk
                @board.board.each do |row, arr|
                    if arr[@player.from] != 0
                        arr[@player.from] = 0
                        break
                    end
                end
                break
            end
        end
  end

    #User quits game
  def quit
    puts "Thanks for playing"
    puts "Better luck next time!"
    exit
  end

    #check if answer is correct
  def win?
    while true
      @board.render(false)
      @player.get_input
      move_valid?
      if @board.board == @board.winningboard
        render(true)
        puts "Congratulations!"
        exit
      end
    end
  end

    #starter method
  def start
    greetings
    @board.num_disks?
    @board.board_init
    win?
  end
end



toh = TowerofHanoi.new
toh.start