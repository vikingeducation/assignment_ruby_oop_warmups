class TowerData
  def initialize stack_size=4
    @goal = goal
    @gameboard = [@goal,[],[]]
    
  end

  def goal
    goal=[]
    @stack_size.downto(1) {|plate| goal << plate }
    goal
  end


end