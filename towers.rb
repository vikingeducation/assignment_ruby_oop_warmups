class TowerOfHanoi
  attr_reader :towers, :player
  def initialize(height)
    @height = height
    @towers = [Tower.new(height,"o"), Tower.new(height, ""), Tower.new(height, "")]
    @player = Player.new

    (1..height).each do |i|
      @towers[0] << ("o" * i)
    end

  end

  #play
  def play

    #intro/greeting, show the board
    Display.intro
    #get move from player
    # move = player.get_move
    Display.render(@towers, @height)
    # print_board(@towers, @height)
    #validate move

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
  def self.intro
    puts "Welcome to Tower Of Hanoi!"
    puts "To quit input q"
  end


  # render/display
  def self.render(towers, height)
    height.times {|i| puts "#{towers[0][i].center(height + 2)}#{towers[1][i].center(height + 2)}#{towers[2][i].center(height + 2)}" }
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

  

end
