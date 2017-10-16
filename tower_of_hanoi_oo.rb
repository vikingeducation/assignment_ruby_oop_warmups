

class TowerOfHanoi

  def initialize(height = 3)
    raise "Invalid height" if height < 3
    @height = height
    build_towers
  end

  def reset
    build_towers
  end

  def build_towers
    @rod_1, @rod_2, @rod_3 = tower_initiator(@height), [], []
    @rods = [@rod_1, @rod_2, @rod_3]
  end

  def tower_initiator(height)
    tower = []
    height.downto(1) {|disk| tower << disk}
    tower
  end

  def welcome_screen
    puts "Welcome to Tower of Hanoi!"
    puts "Instructions:"
    puts "Enter where you'd like to move from and to in the format '1,3'."
    puts "Enter 'q' to quit."
    puts "Current Board:"
  end

  def make_move
    loop do
      puts "Enter move >"
      @move = gets.chomp
      break if @move  == "q"
      break if movement_syntax(@move)
    end
  end

  def ending_screen(var_move)
    if var_move == "q"
      puts "Thank you for playing with us. Good Bye."
      true
    end
  end

  def winning
    if @rod_1.empty? && (@rod_2.empty? || @rod_3.empty?)
      puts "Congratulations. You have won the game. Good Job!"
      true
    end
  end

  def movement_syntax(var_move)
    if var_move.length == 3 && \
        (1..3) === var_move[0].to_i && \
        (1..3) === var_move[2].to_i && \
        "," == var_move[1]
      true
    else
      puts "You have typed incorrect parameters."
      false
    end
  end

  def play
    welcome_screen
    loop do
      render(@height)
      make_move
      break if ending_screen(@move)
      movement_validator(@move)
      break if winning
    end
    reset
  end

  def render(var_height)
    puts "#{@rods}"
    (var_height).downto(1) do |level|
      @rods.each do |rod_num|
        disc_size = rod_num[level - 1]
        if disc_size.nil?
          print "  " * 4 + " ".center(var_height)
        else
          print "  " * 4 + ("="* disc_size).center(var_height)
        end
      end
      print "\n"
    end
    1.upto(3) {|i| print "  "*4 + " ".center(var_height/2) + "#{i}" + " ".center(var_height/2)}
    print "\n"
  end

  def movement_validator(var_move)
    var_move = var_move.split(",").map{|s| s.to_i}
    if @rods[var_move[0] - 1].empty?
      puts "You are trying to move disk from an empty rod. Please try again."
    elsif !@rods[var_move[1] - 1].empty?
      if @rods[var_move[0] - 1].last > @rods[var_move[1] - 1].last
        puts "You can't put bigger disk on a smaller one. Please try again."
      else
        @rods[var_move[1] - 1] << @rods[var_move[0] - 1].pop
      end
    else
      @rods[var_move[1] - 1] << @rods[var_move[0] - 1].pop
    end
  end

end


t = TowerOfHanoi.new(5)
t.play
