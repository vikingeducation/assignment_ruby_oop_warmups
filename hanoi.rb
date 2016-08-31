class TowerOfHanoi
  def initialize(ndisk)
    @ndisk = ndisk
    @rods = [ndisk.downto(1).to_a, [], []]
  end

  def play()
    puts "Welcome to Tower of Hanoi!"
    puts "Instructions:"
    puts "Enter where you'd like to move from and to"
    puts "in the format [1,3]. Enter 'q' to quit."

    loop do
      render
      puts "Enter move >"
        input = gets.strip.downcase
        unless valid_input?(input)
          puts "Invalid input! Use the format [1,3] or enter 'q' to quit."
          next
        end
        break if input == "q"
        move = [input[1].to_i-1, input[3].to_i-1]
        if !valid_move?(move)
          puts "The move is not valid!"
          next
        end
        move_disk(move)
        if win?
          puts "Congrats! You win!"
          break
        end
    end
  end

  def render
    puts "Current Board:"
    @ndisk.downto(1).each do |col|
      (0..2).each do |row|
        n = @rods[row][col-1]?@rods[row][col-1]:0
        print "o"*n+" "*(@ndisk-n+5)
      end
      puts
    end
    puts "1"+" "*(@ndisk+4)+"2"+" "*(@ndisk+4)+"3"
  end

  def valid_input?(input)
    input == "q" || (input.length == 5 && (1..3).include?(input[1].to_i) && (1..3).include?(input[3].to_i))
  end

  def valid_move?(move)
    @rods[move[0]].any? && (!(@rods[move[1]].any?) || (@rods[move[0]][-1] < @rods[move[1]][-1]))
  end

  def move_disk(move)
    disk = @rods[move[0]].pop
    @rods[move[1]] << disk
  end

  def win?
    @rods[1] == @ndisk.downto(1).to_a || @rods[2] == @ndisk.downto(1).to_a
  end

end
end