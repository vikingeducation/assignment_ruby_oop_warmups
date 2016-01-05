class TowerOfHanoi



  #get user's input
  def get_input
    puts "Please enter move: "
    @input = gets.chomp
    
    quit if @input == 'q'
    input1, input2 = @input.split.map(&:to_i)
    #check input
    input_valid?(input1, input2)
  end

  #check if input is valid
  def input_valid?(input1, input2)
    if(1..3).include?(input1 && input2)
      @from = input1 -1
      @to = input2 -1
    else
      puts "Please make sure you entered in format 'num1, num2' between ranges 1 & 3"
      get_input
    end
    #run additional test to see if move is legal
    move_valid?
  end

  #check to see if move is legal in accordance to the rules
  def move_valid?
    @current_disk = 0

    #determine disk piece to be moved
    @board.each do |row, arr|
      if arr[@from] != 0
        @current_disk = arr[@from]
        break
      end
    end

    #determine the highest disk available in that column
    @board.each do |row, arr|
            if arr[@to] != 0
                @top_disk = arr[@to]
                break
            else
                @top_disk = arr[@to]
            end
        end

        #conditional test to see if move is valid
        if @current_disk == 0
            puts "No disks in this column, try again"
            get_input
        elsif @top_disk == 0 || @current_disk < @top_disk
            move_disk
        else
            puts "Move is invalid"
            puts "Please check the rules and input a new move"
            get_input
        end
  end

  #make move
  def move_disk
        @disks.downto(1).each do |idx|
            if @board[idx][@to] == 0
                @board[idx][@to] = @current_disk
                @board.each do |row, arr|
                    if arr[@from] != 0
                        arr[@from] = 0
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
      render(false)
      get_input
      if @board == @winningboard
        render(true)
        puts "Congratulations!"
        exit
      end
    end
  end

  #starter method
  def start
    greetings
    num_disks?
    board_init
    win?
  end
end

toh = TowerOfHanoi.new
toh.start