class GameState(height)

  attr_reader :c1, :c2, :c3

def initialize

  @height = height

  @col1, @col2, @col3 = (1..height).to_a.reverse, [], []

  @win_condition = (1..height).to_a.reverse

  @colmap = {1 => @col1, 2 => @col2, 3 => @col3}

end



  def move(c1, c2)

    if @colmap[c1].length == 0
      puts "There is nothing to take from Column #{c1}"

    elsif @colmap[c1][-1] > @colmap[c2][-1]
      puts "That is an invalid move"

    else
      @colmap[c2] << @colmap[c1].pop  

    end


  end



  def check_win?

    @col3 == @win_condition

  end







end



class Drawer

  def print_board(c1, c2, c3)

    p (c1)

    p (c2)

    p (c3)

  end


end


class MoveParser

end


class Game

  def initialize(height = 3)

    @drawer = Drawer.new

    @parser = MoveParser.new

    @game_state = GameState.new(height)

  end


  def play

#loop goes here

  current_move = @parser.get_valid_move

  @gamestate.move(current_move)

  @drawer.print_board(@gamestate.c1, @gamestate.c2, @gamestate.c3)

  end


end

