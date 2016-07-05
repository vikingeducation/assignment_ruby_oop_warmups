class TowerOfHanoi
  attr_reader :towers, :player
  def initialize(height)
    @towers = [[], [], []]
    @player = Player.new

    (1..height).each do |i|
      @towers[0] << (i * "o")
    end

    @towers[0] = @towers[0].reverse
  end

  #play
  def play

    #intro/greeting, show the board
    Display.intro
    #get move from player
    move = player.get_move
    
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
    render
  end


  #render/display
  def self.render(towers)
    
  end
end
