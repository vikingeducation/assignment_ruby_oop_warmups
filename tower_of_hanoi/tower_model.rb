class TowerModel
	attr_reader :goal, :stack_size, :best, :gameboard, :turns

  def initialize stack_size=4
    create_game stack_size
  end

  def create_game stack_size
    @stack_size = stack_size
    @goal = goal
    @gameboard = [@goal.dup,[],[]]
    @turns = 0
    @best = 2**@stack_size-1  
  end

  def goal
    goal=[]
    @stack_size.downto(1) {|plate| goal << plate }
    goal
  end

  def move_piece move
    return false if !valid? move[0], move[1]
    @gameboard[move[1]-1] << @gameboard[move[0]-1].pop
    @turns += 1
  end

  def valid? plate, target
    return false if !(1..3).include?(plate)
    return ((@gameboard[plate-1][-1] != nil) && (!@gameboard[target-1][-1] || @gameboard[target-1][-1] > @gameboard[plate-1][-1]))
    true
  end

  def win?
    @goal == @gameboard[1] || @goal == @gameboard[2]
  end

  def reset
    if @turns <= @best
      @stack_size += 1
    end
    create_game stack_size
  end

end