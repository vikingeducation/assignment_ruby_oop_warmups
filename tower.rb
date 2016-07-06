class Disc
  attr_reader :size

  def initialize(size)
    @size = size
  end
end

class Tower

  def initialize(height)
    @@winning_height ||= height
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

  def won?
    @stack.size == @@winning_height
  end

  def self.move(from, to)
    to.push(from.pop)
  end

  def pop
    @stack.pop
  end

  def push(item)
    @stack << item
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
    render_board
    puts "Congratulations! You won, #{@name}! You are amazing!"
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
    @towers = []
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
    @towers[1..2].any? { |tower| tower.won? }
  end

  def make_move
    from, to = get_move
    while illegal_move?(from, to)
      puts "That was an illegal move!"
      render_board
      from, to = get_move
    end
    Tower.move(@towers[from], @towers[to])
  end

  def get_move
    puts "Enter move in this form: from, to "
    move = gets.chomp.split(",")
    [move[0].to_i - 1, move[1].to_i - 1]
  end

  def illegal_move?(from, to)
    return true if @towers[from].top.nil?
    if @towers[to].top == nil
      false
    elsif @towers[from].top > @towers[to].top
      true
    else
      false
    end
  end
end
