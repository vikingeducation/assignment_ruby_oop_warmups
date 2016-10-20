# Tower of Hanoi Game - in Modules


# DRAFT 1 (from Kit)

class Game
  def initialize(rings: 3)
    @rings = rings
    @left = ['o'] * rings
    @middle = []
    @right = []
  end

# REVISED

  def initialize(rings: 3)
    @rings = rings
    @pole = []
    @pole[0] = (1..rings).to_a
    @pole[1] = []
    @pole[2] = []
  end

  @pole = [[1,2,3,4,5],[],[]]

# END REVISED

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


# ########################################

DRAFT 2

class Tower
  def initialize(height: 0)
    @discs = (1..height).to_a
  end

  def contains_disc?
    !!@discs[-1]
  end

  def to_s
    @discs.inspect
  end

  def top_disc
    @discs[-1]
  end

  def valid_disc?(disc)
    top_disc > disc
  end
end

class Game
  def initialize(discs: 3)
    @left = Tower.new(height: discs)
    @middle = Tower.new
    @right = Tower.new
  end

  def display_towers
    print "1:"
    puts @left

    print "2:"
    puts @middle

    print "3:"
    puts @right
  end

  def tower_ids
    {1 => @left,
    2 => @middle,
    3 => @right}
  end

  def get_tower(id)
    tower_ids[id]
  end

  def input_on_board?(id)
    (1..3) === id
  end

  def tower_contains_disc?(id)
    get_tower(id).contains_disc?
  end

  def valid_move?(from, to)
    from_disc = get_tower(from).top_disc
    get_tower(to).valid_disc?(from_disc)
  end

  def play
    loop do
      display_towers

      loop do
        puts "Where would you like to move from? (1, 2, or 3)"
        from = gets.chomp.to_i

        break if input_on_board?(from) && tower_contains_disc?(from)
      end

      loop do
        puts "Where would you like to move to? (1, 2, or 3)"
        to = gets.chomp.to_i

        break if input_on_board?(to)
      end

      puts valid_move?(from, to)

      case from
      when 1
        taken_disc = @left.pop
      when 2
        taken_disc = @middle.pop
      when 3
        taken_disc = @right.pop
      end

      case to
      when 1
        @left.push(taken_disc)
      when 2
        @middle.push(taken_disc)
      when 3
        @right.push(taken_disc)
      end

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

