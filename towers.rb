class TowerOfHanoi
  attr_reader :towers, :player
  def initialize(height)
    @height = height
    @towers = [Tower.new(height,"o"), Tower.new(height, ""), Tower.new(height, "")]
    @player = Player.new
  end

  #play
  def play

    #intro/greeting, show the board
    Display.intro(@towers, @height)

    next_move = nil
    #validate move
    until valid_move?(next_move)
      #get move from player
      next_move = player.get_move


    #
    #move piece
    #
    Display.render(@towers, @height)

    #check for victory? or quit

    #
    #salutations

  end

  def valid_move?(move)
    #check that the initial piece is smaller than the target piece

  end

  def victory?

  end

  #victory?
  #valid_move?
  #game_over?

end


class Player

  #get_move
  def get_move
    puts "Enter the initial piece position (# of column):  "
    start_pos = gets.strip
    return "q" if start_pos == "q"
    puts "Enter destination position for piece (# of column): "

    end_pos = gets.strip
    if valid_entry?(start_pos, end_pos)
      return [start_pos, end_pos]
    else
      get_move
    end

  end

  #valid_entry?
  def valid_entry?(start, finish)
    ("1".."3").include?(start) && ("1".."3").include?(finish)
  end


end

class Display

  #greetings/salutations
  def self.intro(towers, height)
    puts "Welcome to Tower Of Hanoi!"
    puts "To quit input q"
    render(towers, height)
  end


  # render/display
  def self.render(towers, height)
    height.times {|i| towers[0].print_row(i) + towers[1].print_row(i) + towers[2] }
    puts "#{(("-"*height).center(height+2))*3}"
    bottom_row = ""
    ("1".."3").each {|ele| bottom_row += ele.center(height+2)}
    puts "#{bottom_row}"
  end
end


class Towers
  attr_reader :height

  def initialize(height, fill)
    @height = height
    @tower = Array.new(height, fill)
  end

  def pull_row(row)
    @tower[row]
  end

  def print_row
    print @tower[row].center(@height + 2)
  end

  def empty_space
    target_block = nil
    empty = nil
    return empty_row, target_block unless @tower.any? ""

    @tower.each_with_index do |ele, i|
      empty_row, target_block = (i - 1), ele unless ele == "" }
    end

    empty_row, target_block
  end

  def first_block

  end
end
