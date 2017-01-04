require_relative 'towers'
require_relative 'view'

class Control
  # init
  #  set up towers
  #  play
  def initialize
    @towers = Towers.new
    @view = View.new
  end

  def play
    @view.welcome
    game_on until game_over?
  end

  def game_on
    get_move until @towers.valid_move?(@move)
    from = @move[0].to_i-1
    to = @move[-1].to_i-1
    @towers.make_move(from, to)
    @view.render(@towers)
    reset_move
  end

  def game_over?
    if @towers.game_won?
      @view.game_won
      exit
    end
  end

  def reset_move
    @move = nil
  end

  def get_move
    @view.render(@towers)
    @view.prompt_move
    @move = gets.strip
    quit?
  end

  def quit?
    exit if ['quit', 'q', 'exit'].include?(@move)
  end

end

toh = Control.new
toh.play
