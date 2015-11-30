class Tower

  def initialize
    @player = Player.new
    @@towers = [[],[],[]]
    @number_of_blocks = nil
    @winning_string = nil
  end

  def game_start

    # Welcome Message
    puts ""
    puts ""
    puts "-=-=-=-=-=-=-=-=-=-=-=-"
    puts "Welcome to Tower of Hanoi!"
    puts "By Steven Chang"
    puts "-=-=-=-=-=-=-=-=-=-=-=-"
    puts ""

    # Asking player to enter tower height.
    puts "Instructions:"
    puts "At any point in the game enter 'q' to quit."
    print "Enter how high you want your tower (a whole number): "
    @number_of_blocks = @player.tower_height

    # Setting up the blocks in correct order to initialize game.
    @number_of_blocks.downto(1) { |block_size| @@towers[0] << block_size }

    # Setting up the winning string
    @winning_string = @@towers[0].join('').to_s

    # Tower Visual
    render

    # Game Kicks Off
    moving_game_point

  end

  # Visual of all 3 towers.
  def render
    i = @number_of_blocks - 1
    while i >= 0
      puts (" " * (@number_of_blocks - @@towers[0][i].to_i)) + "[" + ("=" * @@towers[0][i].to_i * 2) + "]" + (" " * (@number_of_blocks - @@towers[0][i].to_i)) + (" " * (@number_of_blocks - @@towers[1][i].to_i)) + "[" + ("=" * @@towers[1][i].to_i * 2) + "]" + (" " * (@number_of_blocks - @@towers[1][i].to_i)) + (" " * (@number_of_blocks - @@towers[2][i].to_i)) + "[" + ("=" * @@towers[2][i].to_i * 2) + "]" + (" " * (@number_of_blocks - @@towers[2][i].to_i))
      i -= 1
    end

    if @number_of_blocks >= 3
      puts (" " * (@number_of_blocks - 2)) + "Tower 1" + (" " * (@number_of_blocks - 3)) + (" " * (@number_of_blocks - 2)) + "Tower 2" + (" " * (@number_of_blocks - 3)) + (" " * (@number_of_blocks - 2)) + "Tower 3"
    else
      puts "Tower 1  Tower 2  Tower 3"
    end
  end

  # Moving blocks around and Ending the game.
  def moving_game_point
    until @@towers[2].join('').to_s == @winning_string
      starting_tower = @player.moving_from
      destination_tower = @player.moving_to
      if @@towers[destination_tower.to_i-1][-1].to_i == 0
        @@towers[destination_tower.to_i-1] << @@towers[starting_tower.to_i-1].pop
        render
      elsif @@towers[starting_tower.to_i-1][-1].to_i < @@towers[destination_tower.to_i-1][-1].to_i
        @@towers[destination_tower.to_i-1] << @@towers[starting_tower.to_i-1].pop
        render
      else
        puts "That combination doesn't work, let's try again."
      end
    end

    puts "YOU DID IT!!!!"
  end

end

class Player < Tower

  def initialize
  end

  def choose_valid_tower(user_input)
    until ["1","2","3"].include? user_input
      print "Please enter either 1, 2 or 3: "
      user_input = response
    end
    user_input
  end

  def height_validate(string)
    until string.to_i != 0
      print "Try again (any whole number from 1 up): "
      string = response
    end
    string.to_i
  end

  def moving_from
    puts ""
    print "Enter which tower you'd like to grab a block from: "
    tower = response
    tower_not_empty(choose_valid_tower(tower))
  end

  def moving_to
    puts ""
    print "Enter which tower you'd like to place your selected block: "
    tower = response
    tower_not_full(choose_valid_tower(tower))
  end

  def response
    string = gets.chomp
    exit if string == 'q'
    string
  end

  def tower_height
    height = response
    height_validate(height)
  end

  # Checking to see if the selected tower has anything in it.
  def tower_not_empty(user_input)
    while @@towers[user_input.to_i-1].empty?
      print "Please enter a tower with a block in it: "
      user_input = response
    end
    user_input
  end

  # Checking to see if the selected tower is full.
  def tower_not_full(user_input)
    while @@towers[user_input.to_i-1].size == @number_of_blocks
      print "Please enter a tower that isn't full: "
      user_input = response
    end
    user_input
  end

end

Tower.new.game_start