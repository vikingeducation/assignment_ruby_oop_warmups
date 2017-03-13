class TOH

  def initialize
    @board = Board.new(3)
  end

  def play
    
    instructions
    @board.render

    loop do
      get_move
      if @board.valid_move?(@from, @to)
        @board.update(@from, @to)
        @board.render
      end
      break if victory?
    end
  
  end

  def instructions
    puts
    puts "======================================================================"
    puts "***Welcome to Tower of Hanoi!***"
    puts
    puts "The goal of the game is to move all the disks from tower 1 to tower 3."
    puts "You can only move one disc at a time."
    puts "Also, you cannot place larger discs on top of smaller ones."
    puts
    puts "Enter where you like to move from and to in the format '1>3'."   
    puts "Press 'q' and hit enter to exit the game."
    puts 
    puts "Hit ENTER when you're ready to start!"
    puts "======================================================================"
    gets
  end

  def get_move
    print "Enter your move > "
    @move = gets.chomp
    puts
    input_format_check(@move)
  end

  def input_format_check(move)
    if (move[0].to_i.between?(1,3) && move[2].to_i.between?(1,3)) && move[1] == '>'
      @from = move[0].to_i
      @to = move[2].to_i
    else 
      @board.error_message("format_error")
    end
  end

  def victory?
    if (@board.instance_variable_get("@towers")[3] == (1..@board.instance_variable_get("@height")).to_a)
      puts
      puts "Congrats, you won! Goodbye!"
      puts
    end
  end

end

class Board

  def initialize(height = 3)
    @height = height
    @towers = {
      1 => initial_tower,
      2 => [],
      3 => []
    } 
    print
  end

  def initial_tower
    tower = []
    1.upto(@height) {|disc| tower.push(disc)}
    tower
  end

  def render

    1.upto(@height) do |row_number|
      
      1.upto(3) do |tower_index|
        tower = @towers[tower_index]
        disc = tower[row_number-@height-1]

        if disc.nil?
          to_print = ""
        else 
          to_print = "o"*disc
        end
        print to_print.ljust(@height + 2)
      end  
      puts
    end

    1.upto(3) do |tower_index|
      platform = "="*@height 
      print platform.ljust(@height + 2)
    end 

    puts

    1.upto(3) do |tower_index|
      print tower_index.to_s.ljust(@height + 2) 
    end 

    puts
    puts
  end

  def valid_move?(from, to)
    return false unless has_disc?(from)
    return false unless valid_destination?(from, to)
    true
  end

  def has_disc?(tower_index)
    if @towers[tower_index].length > 0
      true
    else
      error_message("disc_error")
    end
  end

  def valid_destination?(from, to)
    if @towers[to].empty? || @towers[from].first < @towers[to].first
      true
    else
      error_message("tower_error")
    end
  end

  def update(from, to)
    @towers[to].unshift(@towers[from].shift)
  end

  def error_message(kind)
    puts
    puts "That's not a valid move."
    
    if kind == "format_error"
      puts "Please enter your move in the following format (without the single quotes): '1>3'."
      puts "Also make sure your input numbers fall are in the range of 1 to 3."
      puts
    elsif kind == "tower_error"
      puts "You can't move your disc to that tower."  
    elsif kind == "disc_error"
      puts "Make sure you're selecting a disc!"
    end

    puts

  end 

end


TOH.new.play