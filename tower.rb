class Tower

  def initialize(height = 0)
    if height > 0
      tower = (1..height).to_a.reverse
    else
      tower = []
    end
    tower
  end

end

class Player

  def initialize
  end

  def get_input
    input = gets.chomp
    from_tower = input[1]
    to_tower = input[3]

    unless input_valid?(from_tower, to_tower)
      input = gets.chomp
    end

    from_tower = input[1]
    to_tower = input[3]

    return_array = [from_tower, to_tower]
    return_array
  end

  def input_valid?(from_tower, to_tower)
    if (1..3) === from_tower || (1..3) === to_tower
      print "its valid"
      return true
    else
      print "Invalid input. Please enter move again:"
      return false
    end

  end
end

class Game

  def initialize
    #rules
    puts "Welcome to Tower of Hanoi"
    puts "Please Enter moves [1, 3]"
    puts "Enter how many disks you want to play"
    print ">>"
    input = gets.chomp.to_i
    @left_tower = Tower.new(input)
    @mid_tower = Tower.new
    @right_tower = Tower.new
    @goal_tower_amount = Tower.new(input)
    @player = Player.new
    @board = [@left_tower, @mid_tower, @right_tower]

    play
  end

  def can_move?(from, to)
    good_move = true
    good_move = false if @board[from-1].empty?   # if from is empty
    # if disk is bigger than disk on to_tower
    good_move = false if @board[from-1][-1] > @board[to-1][-1]
    good_move
  end

  def game_won?

    if @right_tower == @goal_tower_amount
      return true
    else
      return false
    end

  end

  def move_disk (from, to)
    @board[to-1] << @board[from-1][-1].pop
  end

  def render
    # space = @goal_tower_amount.length * 2

    # (@goal_tower_amount.length - 1).downto (0) do |row|

    #   @board.each do |tower|
    #     if tower[row].nil?
    #       print " " * (space)
    #     else
    #       print ("+" * tower[row]).ljust(space , " ")
    #     end
    #   end

    #   print "\n"
    # end
    # puts "1".ljust(space, " ") + "2".ljust(space, " ") + "3"
    print @board
  end


  def play
    render
    unless game_won?
      print ">>"
      moves = @player.get_input
      unless can_move?(moves[0], moves[1])
        print "Move is invalid. Please enter valid move >>"
        moves = @player.get_input
      end
      move_disk(moves[0], moves[1])
      render
    end
    print "You Won!"
  end



end