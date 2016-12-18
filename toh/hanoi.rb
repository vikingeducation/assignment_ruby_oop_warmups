require './towers.rb'

class TowerOfHanoi
  def initialize(discs=3)
    @discs = discs
    @towers = Towers.new(@discs)
    @move = ''
    @from = ''
    @to = ''
    @game_over = false
    play
  end

  def play
    welcome
    @towers.render

    until game_over?
      get_move until valid_move?
      puts

      make_move

      @towers.render

      if won?
        puts "Congratulations! You've won!"
        exit
      end

      reset_move

    end


  end

  def won?
    @towers.tower.each_with_index do |tower, i|
      return true if i != 0 && tower == (1..@discs).to_a.reverse
    end
    false
  end

  def game_over?
    @game_over
  end

  def reset_move
    @move = ''
    @from = ''
    @to = ''
  end

  def make_move
    # copy top disc of 'from' tower
    disc = @towers.tower[@from].min

    # place copy of disc on bottom-most slot of new tower
    @towers.tower[@to] << disc

    # remove disc from original tower
    @towers.tower[@from].delete(disc)

  end

  def move_to_index
    @from = @move[0].to_i - 1
    @to = @move[-1].to_i -1
  end

  def valid_move?
    # make sure input is in right format
    return false unless right_format?

    # store moves as tower index numbers named @from and @to
    move_to_index

    # make sure towers exist
    return false if missing_tower?

    # make sure 'from' tower has disc
    return false if tower_empty?

    # if tower we've moving disc to is not empty
    # make sure we're putting a smaller disc on a larger disc
    unless @towers.tower[@to].empty?
      return false if incorrect_order?
    end

    # validate move
    true
  end

  def incorrect_order?
    puts "No disc may be placed on top of a smaller disc" if @towers.tower[@from].min > @towers.tower[@to].min
    @towers.tower[@from].min > @towers.tower[@to].min
  end

  def tower_empty?
    puts "We couldn't find any discs to transfer. Try transferring discs from another tower" if @towers.tower[@from].empty?
    @towers.tower[@from].empty?
  end

  def missing_tower?
    if @towers.tower[@from].nil? || @towers.tower[@to].nil?
      puts "Tower not found. Please move disc between our available towers: #{(1..@discs).to_a}"
    end
  end

  def right_format?
    return true if @move.length == 3 && @move[1] == ','
    puts "You might have got your tower numbers or the format wrong."
    puts "Enter where you'd like to move from and to in the format '1,3'."
    false
  end

  def move_to_index
    @from = @move[0].to_i-1
    @to = @move[-1].to_i-1
  end

  def get_move
    puts "\nEnter move >"
    @move = gets.chomp
    # let user exit if needed
    quit?
  end

  def quit?
    exit if @move == 'q' || @move == 'quit' || @move == 'exit'
  end

  def welcome
    puts 'Welcome to Tower of Hanoi!'
    puts 'Instructions:'
    puts 'Enter where you\'d like to move from and to in the format \'1,3\'. Enter \'q\' to quit.'
  end


end

t = TowerOfHanoi.new
