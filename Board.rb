class Board

  def initialize
    @board = Hash.new(0)
    @winningboard = Hash.new(0)
    @disks = nil
    @first_disc = nil
    @second_disc = nil
  end

  attr_accessor :first_disc, :second_disc, :disks, :board, :winningboard
  #set difficulty level
  def num_disks?
    puts "Please enter number of disks, has to be 3 or above."
    @disks = gets.chomp.to_i

    if @disks < 3
      puts "number of disks entered was too low"
      num_disks?
    end
  end

  #create board depending on num of disks & create the winning board
  def board_init
    (1..@disks).each do |idx|
      @board[idx] = [idx, 0, 0]
      @winningboard[idx] = [0, 0, idx]
    end
  end

  #display current board
  def render(win)
    puts "="*(@disks+2)*3
    puts "--Winning Board!--\n" if win
    puts "Current Board:\n" unless win == true
    puts "~"*(@disks+2)*3

    @board.each do |row, arr|
      (0..2).each do |idx|
        disk = "o"*arr[idx]
        print disk.ljust(@disks + 2)
      end
      print "\n"
    end

    #print bottom base
    puts "~"*(@disks+2)*3
    (1..3).each {|pos| print pos.to_s.ljust(@disks + 2)}
    puts "\n" + "="*(@disks+2)*3
  end

end
