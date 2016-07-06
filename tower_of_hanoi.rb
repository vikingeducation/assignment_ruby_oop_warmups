class Tower

  def initialize(number_of_disks)
    @number_of_disks = number_of_disks
    @board = Board.new(number_of_disks)
    @player = Player.new(@board)
    print_instructions
  end


  def play
    
    loop do
      @board.render
      @player.make_move
      break if check_game_over
    end
  end


  def print_instructions
    puts "Welcome to Tower of Hanoi!"
    puts "You're playing with #{@number_of_disks} disks! Good luck."
    puts "To move the top disk in one tower to the top of another tower, please enter your move in the format 1,3 with the first number being the tower to move from and the second number being the tower to move to."
  end

  def check_game_over
    if @board.winning_tower?
      congratulate
      true
    else
      false
    end
  end

  def congratulate
    puts "\n"
    @board.render
    puts "You win! Way to go!"
  end

end



class Board

  def initialize(number_of_disks)
    @number_of_disks = number_of_disks
    @tower_array = [(1..(number_of_disks.to_i)).to_a.reverse, [], []]
    @winning_tower = @tower_array[0]
  end

  def render
    puts "Current Board:"
    counter = @number_of_disks - 1
    while counter >= 0
      tower_counter = 0
      while tower_counter < 3
        if @tower_array[tower_counter][counter] != nil
          printing_amount = @tower_array[tower_counter][counter]
          print ("#" *  printing_amount) + " " * (@number_of_disks -  printing_amount + 1)
        else
          print " " * (@number_of_disks + 1)
        end
        tower_counter += 1
      end
      puts "\n"
      counter -=1
    end
    print "1".ljust(@number_of_disks + 1) + "2".ljust(@number_of_disks + 1) + "3".ljust(@number_of_disks + 1)
  end

  def winning_tower?
    @tower_array[1] == @winning_tower || @tower_array[2] == @winning_tower
  end

  def make_player_move(move)
    if valid_move?(move)
      @tower_array[move[1]] << @tower_array[move[0]].pop
      true
    else
      false
    end
  end

  def valid_move?(move)
    if within_game_board?(move)
      if origin_tower_available?(move)
        destination_tower_available?(move)
      end
    end
  end

  def within_game_board?(move)
    if (0..2).include?(move[0]) && (0..2).include?(move[1])
      true
    else
      puts "You're asking for a tower that does not exist. Each number should only be between 1 and 3."
    end
  end

  def origin_tower_available?(move)
    if @tower_array[move[0]].size > 0
      true
    else
      puts "The tower you've selected has no disks to move. Please try again."
      false
    end
  end

  def destination_tower_available?(move)
    if @tower_array[move[1]].empty?
      true 
    elsif @tower_array[move[0]][-1] > @tower_array[move[1]][-1]
      puts "The top disk of the tower you're trying to move to is larger than the disk you're trying to move. Please try again."
      false
    else
      true
    end
  end

end



class Player


  def initialize(board)
    @board = board
  end



  def make_move
    loop do
      move = ask_for_move
      if validate_format(move)
        if @board.make_player_move(move)
          break
        end
      end
    end
  end

  def ask_for_move
    print "\n"
    puts "What's your next move?"
    print ">"
    gets.chomp.split(",").map(&:to_i).map! {|i| i - 1}
  end

  def validate_format(move)
    if move.is_a?(Array) && move.size == 2 
      true
    else
      puts "Your input is in the wrong format! Please try again"
    end

  end

end


new_tower = Tower.new(10)
new_tower.play

