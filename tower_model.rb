class TowerModel
	attr_reader :goal, :stack_size, :best_possible
	attr_accessor :gameboard, :turns

  def initialize stack_size=4
    @stack_size = stack_size
    @goal = goal
    @gameboard = [@goal,[],[]]
    @turns = 0
    @best_possible = 2**@stack_size-1    
  end

  def goal
    goal=[]
    @stack_size.downto(1) {|plate| goal << plate }
    goal
  end


end