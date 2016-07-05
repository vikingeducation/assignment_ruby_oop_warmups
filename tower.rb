# until winning condition
#   ask for move
#   try to make the move
#   if move didn't work, print error

class Disc
  attr_reader :size

  def initialize(size)
    @size = size
  end
end

class Tower

  def initialize(height)
    @stack = []
    add_discs(height)
  end

  def add_discs(height)
    height.downto(1) do |size|
      @stack << Disc.new(size)
    end
  end

  def render
    @stack.each do |disc|
      print disc.size.to_s + " "
    end
  end

  def top
    return nil if @stack.empty?
    @stack.last.size
  end
end

class Game
  def initialize
    @towers = []
  end

  def play
    get_name
    get_height
    setup_board
    until game_over? do
      render_board
      make_move
    end
    puts "Congratulations! You won! You are amazing!"
  end

  def get_name
    puts "What is your name?"
    @name = gets.chomp
  end

  def get_height
    height = 0
    until height > 0 do
      puts "What is the height?"
      height = gets.chomp.to_i
    end
    @height = height
  end

  def setup_board
    @towers << Tower.new(@height) << Tower.new(0) << Tower.new(0)
  end

  def render_board
    @towers.each do |tower|
      print "X "
      tower.render
      puts
    end
  end

  def game_over?
    false
  end

  def make_move
    until 
    from, to = get_move
    illegal_move?(from, to)
  end

  def get_move
    puts "Enter move in this form: from, to "
    move = gets.chomp.split(",")
    [move[0].to_i - 1, move[1].to_i - 1]
  end

  def illegal_move?(from, to)
    if @towers[to].top == nil
      true
    elsif @towers[from].top > @towers[to].top
      false
    else
      true
    end
  end
end
