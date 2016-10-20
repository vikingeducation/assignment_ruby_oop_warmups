# Tower of Hanoi Game - in Modules


# DRAFT (from Kit)

class Game
  def initialize(rings: 3)
    @rings = rings
    @left = ['o'] * rings
    @middle = []
    @right = []
  end

  def display_towers
    print "1:"
    p @left

    print "2:"
    p @middle

    print "3:"
    p @right
  end

  def take_piece
      puts "Where would you like to move from? (1, 2, or 3)"
      from = gets.chomp.to_i

      case from
      when 1
        if @left[-1]
          @left.pop
        else
          take_piece
        end
      when 2
        if @middle[-1]
          @middle.pop
        else
          take_piece
        end
      when 3
        if @right[-1]
          @right.pop
        else
          take_piece
        end
      else
        puts "Invalid move."
        take_piece
      end
  end

  def place_piece(piece)
      puts "Where would you like to move to? (1, 2, or 3)"
      to = gets.chomp.to_i

      case to
      when 1
        @left.push(piece)
      when 2
        @middle.push(piece)
      when 3
        @right.push(piece)
      else
        puts "Invalid move."
        place_piece(piece)
      end
  end

  def play
    loop do
      display_towers
      place_piece(take_piece)
    end
  end
end

# Display the board √
# Ask the user for a move
# # Ask again on invalid input
# Make the move
#
# # If they win then break loop and display board

# --------------
# Hanoi
# Tower
# Disc

game = Game.new
game.play