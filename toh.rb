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

    # print @board.inspect

  end

  def play

    p "Let's play Tower of Hanoi"
    p "To quit type 'q'"

    while true



    end



  end


  def move

    get_from
    get_to



    p "To what stack do you want to move?"
    to_stack = gets.chomp.to_i

  end

  def get_from

    p "From what stack do you want to move?"
    from_stack = gets.chomp.to_i - 1

    if from_stack > 2 || from_stack < 0
      p "Invalid stack input"
      get_from
    end

    if board[from_stack].reduce == 0
      p "Cannot choose empty stack"
      get_from
    end

  end

  def get_to

    p "To what stack do you want to move?"
    to_stack = gets.chomp.to_i - 1



  end


  def display_board

    @disks.times do |row|
      3.times do |disc|
        print "O" * (@board[disc][row]) + (" " * (@disks - @board[disc][row] + 5))
      end
      print "\n"
    end
    print "Stack 1" + (" " * 2) + "Stack 2" + (" " * 2) + "Stack 3" + (" " * 2)

  end

  def victory

    

  end



end





p "How many disks you want to play with"
game = TowerOfHanoi.new(gets.chomp.to_i)
game.display_board
