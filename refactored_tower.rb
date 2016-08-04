class TowerOfHanoi
  attr_accessor :board, :counter

  def initialize(tower_height)
    @tower_height = tower_height.to_i
    @counter = 0
  end

  def build_tower
    @board = [[],[],[]]
    @tower_height.times do
      board[0] << 'o'
    end
  end

  def display
    p board[0]
    p board[1]
    p board[2]
  end

  def win?
    @board[1].length == @tower_height || @board[2].length == @tower_height
  end

  def game_over?
    if win? && @counter <= 4
      puts "You win!"
      exit
    elsif !win? && @counter == 4
      puts "You lose!"
      exit
    end
  end

  def quit?
    if @user_start == 'q' || @user_end == 'q'
      puts "Goodbye"
      exit
    end
  end

  def intro
    puts "# Welcome to Tower of Hanoi!"
    puts "# Instructions:"
    puts "# To exit game, enter q for both prompts"
    puts "# You will have 4 tries"
    puts "# Enter where you'd like to move from and to."
  end

  def prompt
    puts "# Your total moves: #{@counter}"
    puts "# Current Board:"
    display
    puts "# Enter starting position > "
    puts "# ..."
    @user_start = gets.chomp
    puts "# Enter ending position > "
    puts "# ..."
    @user_end = gets.chomp
  end

  def move_tower
    @board[@user_start.to_i].pop
    @board[@user_end.to_i].push('o')
    @counter += 1
  end

  def game
    while !quit?
      prompt
      move_tower
      game_over?
    end
  end

  def play
    build_tower
    intro
    game
  end
end