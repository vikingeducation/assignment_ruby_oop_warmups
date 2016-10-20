# Tower of Hanoi Game - in Modules


# DRAFT 2 (from Kit)

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

# new lines
  def win?(to)
    if get_tower(to).length == (height - 1)
    end
# end new lines




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

#      puts valid_move?(from, to)

# new lines

      if valid_move?(from,to) == false
        puts "invalid move from tower #{from} to tower #{to}"
        redo
      else 
        puts "valid move from tower #{from} to tower #{to}"
      end
# end new lines

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

# new lines
      if win?(to)
        print "you have won -- all discs are on tower #{get_tower(to)}"
        quit
      end
# end new lines

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

