class TowersOfHanoi
  attr_reader :discs, :moves

  # sets discs, base_disc_size = discs and moves = 0
  #
  # @param [int] discs number of discs to start with
  #
  def initialize(discs = 3)
    @discs = discs
    @base_disc_size = discs
    @moves = 0
    @start_tower = 1
    @victory = false
    create_towers
    # reset(@discs)
  end

  #
  # set up the towers as empty, then build the first one
  #
  #
  # @return [nil] nil
  #
  def create_towers
    @towers = {
      1 => [],
      2 => [],
      3 => []
    }
    build_tower(@start_tower, @base_disc_size)
    nil
  end

  #
  # builds the given tower with the given number of discs
  #
  # @param [int] tower tower number to build
  # @param [int] discs OPTIONAL [=0] number of discs to build on tower
  #
  # @return [nil] nil
  #
  def build_tower(tower, discs = 0)
    discs.downto(1) { |n| @towers[tower].push(n) }
    nil
  end

  #
  # resets everything for the same instance
  #
  # @param [int] discs - OPTIONAL, defaults to number of discs used when
  #   instance was created. Sets number of discs to use on new game.
  #
  # @return [nil] nil
  #
  def reset(discs = @base_disc_size)
    # base disc will always be as wide as the number of discs
    initialize(discs)
  end

  #
  # If there has been a victory, resets params for a new game, but at the
  # current tower and with the same number of discs
  #
  # @return [nil] nil
  #
  def new_game_current_tower_start
    return false unless @victory
    @moves = 0
    @start_tower = check_towers.last
    @victory = false
    true
  end

  #
  # makes sure user-entered move is valid
  # moves disc if valid
  #
  # @param [int] from : tower to move disc from
  # @param [int] to : tower to move disc to
  #
  # @return [bool] true if move made, false if not
  #
  def move(from, to)
    @from, @to = from, to
    if valid_move?
      make_move
      @moves += 1
      valid = true
    else
      valid = false
    end
    @from, @to = nil
    valid
  end

  #
  # actually makes the move
  #
  # @return [nil] nil
  #
  def make_move
    @towers[@to].push(@towers[@from].pop)
    nil
  end

  #
  # checks if inputs to #move are valid integers. i.e. they are integers,
  # the source is not empty, and the dest is not smaller than the source.
  #
  # @return [bool] true if move is valid, false if it's not
  #
  def valid_move?
    if int?(@from, @to)
      unless empty_tower?(@from)
        return true if legal?
      end
    end
    false
  end

  #
  # checks if each int given is an int
  #
  # @param [int] *args one or more ints to check
  #
  # @return [bool] true if all args given were ints, false if not
  #
  def int?(*args)
    args.each do |i|
      unless i.is_a?Integer
        puts "This takes 1 (or more) integer(s). '#{i}' is not an integer."
        instructions
        return false
      end
    end
    true
  end

  #
  # checks if 'from' tower is empty
  #
  # @param [int] tower tower number to check
  #
  # @return [bool] true if tower is empty, false if
  #
  def empty_tower?(tower, display = true)
    if @towers[tower].empty?
      puts "Tower #{tower} is empty, please choose another tower." if display
      true
    else
      false
    end
  end

  #
  # checks for legal move, i.e. if disc on 'from' tower is smaller than disc
  # on 'to' tower.
  #
  # @return [bool] true if move is legal, false if not
  #
  def legal?
    case @towers[@to].last
    when nil
      true
    when proc { |i| @towers[@from].last > i }
      puts "The disc you are trying to move on tower #{@from} is larger"
      puts "than the the top disc on tower #{@to}."
      false
    when @towers[@from].last
      puts "You have to move it to a different tower than it's currently on."
      false
    else
      true
    end
  end

  #
  # checks if the user has won or not
  #
  #
  # @return [bool] True if victory, false if
  #
  def victory?
    empty_towers, full_tower = check_towers

    # if there are 2 empty towers, the full one can't be the same as the
    # start, that would mean the user didn't move the discs.
    @victory = (empty_towers == 2 && full_tower != @start_tower)
  end

  #
  # Loops through the towers, sets "full_tower" to the last one that
  # contains discs, and counts the empty towers.
  #
  #
  # @return [Array[int, int]] total number of empty towers, full tower
  #
  def check_towers
    empty_towers = 0
    full_tower = nil

    @towers.keys.each do |tower|
      empty_tower?(tower, false) ? empty_towers += 1 : full_tower = tower
    end
    [empty_towers, full_tower]
  end

  def render
    rows = tower_labels
    height = max_height
    height.times do |row|
      rows.push(format_row(row))
    end
    rows.push('')
    rows.reverse.each { |row| puts row }
    nil
  end

  def max_height
    @towers.values.reduce(0) do |max, tower|
      len = tower.length
      len > max ? len : max
    end
  end

  def tower_labels
    labels = []
    labels.push(@towers.keys.map do |i|
      i.to_s.center(@base_disc_size + 2)
    end.join)
  end

  def format_row(row)
    cells = []
    @towers.values.each do |tower|
      cells.push(format_cell(tower[row]))
    end
    cells.join
  end

  def format_cell(cell)
    cell.nil? ? content = '' : content = '=' * cell
    content.center(@base_disc_size + 2)
  end

  def instructions
    puts 'Welcome to Towers Of Hanoi!'
    puts "Enter where you'd like to move from and to, ie. #move(1,3)."
    puts "Reset towers with #reset([number_of_discs]). Use #quit to quit."
  end
end
