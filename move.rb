class Move

  attr_accessor 
  def move
    puts "Enter move >"
    move = gets.chomp
    exit if move == "q"
    @source_column = move[0].to_i - 1
    @destination_column = move[2].to_i - 1
    register_move if check_move == true
  end

  def check_move
    if (0..2).include?(@source_column) == false || (0..2).include?(@destination_column) == false
      puts "Please enter your answer in the format '1,3'."
      move
    else
      true
    end

    if @columns[@source_column].last.nil?
      puts "Not a valid move!"
      move
    elsif @columns[@destination_column].empty? == false && @columns[@source_column].last > @columns[@destination_column].last 
      puts "Not a valid move!"
      move
    else
      true
    end
  end

  def register_move
    @moving_disk = @columns[@source_column].pop
    @columns[@destination_column] << @moving_disk
  end
end
