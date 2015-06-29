class TowerOfHanoi

  def initialize (d)

    @disks = d
   
    @board = [(1..d).to_a,[],[]]
    2.times do |i|
      d.times do |j|
        @board[i+1] << 0
      end
    end 

    @victory_board = [[], [], (1..d).to_a]
    2.times do |i|
      d.times do |j|
        @victory_board[i] << 0
      end
    end 

  end

  def play

    p "Let's play Tower of Hanoi"
    p "To quit type 'q'"
    render

    while true

      move
      render

      if @board == @victory_board
        puts "You win!"
        exit
      end

    end

  end


  def move
    #[1,2,3][0,0,0][0,0,0]
    get_from #1
    get_to #2

    disk = @board[@from_stack].detect {|i| i != 0}
    #disk = 1
    index_from = @board[@from_stack].index(disk)
    #index_from = 0
    @board[@from_stack][index_from] = 0
    #[0,2,3][0,0,0][0,0,0]

    first_value = @board[@to_stack].detect {|i| i != 0}

    if first_value.nil?
      @board[@to_stack][-1] = disk
      #[0,2,3][0,0,1][0,0,0]
    else
      @board[@to_stack][@board[@to_stack].index(first_value) - 1] = disk

    end


  end

  def get_from

    p "From what stack do you want to move?"
    @from_stack = gets.chomp.to_i - 1

    if @from_stack > 2 || @from_stack < 0
      p "Invalid stack input"
      get_from
    end

    if @board[@from_stack].reduce(:+) == 0
      p "Cannot choose empty stack"
      get_from
    end

  end

  def get_to

    p "To what stack do you want to move?"
    @to_stack = gets.chomp.to_i - 1

    if @to_stack > 2 || @to_stack < 0
      p "Invalid stack input"
      get_to
    end

    if !@board[@to_stack].detect {|i| i != 0}.nil?

      if @board[@to_stack].detect {|i| i != 0} < @board[@from_stack].detect {|i| i != 0}
        p "Invalid. There's a smaller disk in that stack"
        get_to
      end

    end

  end


  def render

    puts "Current board: "

    @disks.times do |row|
      3.times do |disc|
        print "O" * (@board[disc][row]) + (" " * (@disks - @board[disc][row] + 5))
      end
      print "\n"
    end
    print "Stack 1" + (" " * 2) + "Stack 2" + (" " * 2) + "Stack 3" + (" " * 2)

  end

  def display_board

    print @board + "\n"

  end

end


p "How many disks you want to play with"
game = TowerOfHanoi.new(gets.chomp.to_i)
game.play
