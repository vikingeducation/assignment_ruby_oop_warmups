class Towers
  DISCS = 3
  attr_reader :tower
  def initialize
    @tower = [ build, [], [] ]
  end

  def build
    first = []
    (1..DISCS).each do |n|
      first.unshift(n)
    end
    first
  end

  def game_won?
    @tower.each_with_index do |tower, i|
      return true if i != 0 && tower == (1..DISCS).to_a.reverse
    end
    false
  end

  def make_move(from, to)
    disc = @tower[from].min
    @tower[to] << disc
    @tower[from].delete(disc)
  end

  def valid_move?(move)
    # make sure move is not nil
    return false unless move
    # make sure input is in right format
    return false unless right_format?(move)

    # store moves as tower index numbers named from and @to
    from = move[0].to_i-1
    to = move[-1].to_i-1

    # make sure towers exist
    return false if missing_tower?(from, to)

    # make sure 'from' tower has disc
    return false if tower_empty?(from)

    # if tower we've moving disc to is not empty
    # make sure we're putting a smaller disc on a larger disc
    unless @tower[to].empty?
      return false if incorrect_order?(from, to)
    end

    # validate move
    true
  end


  def right_format?(move)
    return true if move.length == 3 && move[1] == ','
    puts "You might have got your tower numbers or the format wrong."
    puts "Enter where you'd like to move from and to in the format '1,3'."
    false
  end

  def incorrect_order?(from, to)
    puts "No disc may be placed on top of a smaller disc" if @tower[from].min > @tower[to].min
    @tower[from].min > @tower[to].min
  end

  def tower_empty?(from)
    puts "We couldn't find any discs to transfer. Try transferring discs from another tower" if @tower[from].empty?
    @tower[from].empty?
  end

  def missing_tower?(from, to)
    if @tower[from].nil? || @tower[to].nil?
      puts "Tower not found. Please move disc between our available towers: #{(1..DISCS).to_a}"
    end
    @tower[from].nil? || @tower[to].nil?

  end



end
