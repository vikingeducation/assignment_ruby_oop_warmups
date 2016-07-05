class TowerOfHanoi
  def initialize(height)
    @towers = [[], [], []]
  end

  #play
  def play

    #intro/greeting, show the board
    Display.intro
    #get move from player
    #
    #validate move
    #
    #check for victory? or quit
    #
    #salutations

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
    valid_entry?
    puts "Enter destination position for piece (# of column): "

    end_pos = gets.strip

  end

  #valid_entry?

end

class Display
  #greetings/salutations
  def self.intro
    puts "Welcome to Tower Of Hanoi!"
    puts "To quit input q"
    render
  end


  #render/display
  def self.render

  end
end
