class Tower

  def initialize(tower = 0)
    @tower = tower
  end

  def render
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
      return false
    end

  end
end

class Game

  def initialize
    #rules
    # puts "Welcome to Tower of Hanoi"
    # puts "Please Enter moves [1, 3]"
    # puts "Enter how many disks you want to play"
    # print ">>"
    input = gets.chomp
    @left_tower = Tower.new(input)
    @mid_tower = Tower.new
    @right_tower = Tower.new
    @goal_tower_amount = Tower.new(input)
    @player = Player.new



    #
  end

  def can_move?()
    # if 
  end

  def game_won?

    if @right_tower == @goal_tower_amount
      return true
    else
      return false
    end

  end

  def play

    unless game_won?
      print ">>"
      moves = @player.get_input
      can_move?(moves[0], moves[1])


    end


  end



end