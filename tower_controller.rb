require './tower_render'
require './tower_model'

class TowerController
  
  Quit = ["q", "quit", "exit"]

	def initialize(stack_size = 4)
		@game = TowerModel.new(stack_size)
    play
  end

  def input
    move = gets.chomp
    exit if quit? move
    move.to_i
  end

  def current_move
    TowerRender.pickup_line
    plate = input
    TowerRender.putdown_line
    target = input
    [plate,target]
  end

  def finished
    TowerRender.won @game.turns, @game.best
    if gets.chomp == "yes"
      @game.reset
      play
    end
  end
	
  def play
    TowerRender.welcome_message(@game.stack_size)
    begin
      TowerRender.render @game.gameboard, @game.stack_size
      if @game.move_piece current_move
        TowerRender.render @game.gameboard, @game.stack_size
      else
        TowerRender.error
      end
    end until @game.win?
    finished
	end

  def quit? input
    Quit.include? input
  end


end

t = TowerController.new(2)
