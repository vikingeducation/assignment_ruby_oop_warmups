require "io/console"

class ComputerPalyer

  attr_reader :name

  def initialize
    @name = "CPU"
  end 

  def cpu_move
    move = rand(1..5)
    return move
  end
end

class HumanPalyer

  attr_reader :name

  def initialize(name)
    @name = name
  end 

  def player_move
    chosen_move = 0
    puts "\n#{@name} what move would you like to make? Please enter 1-5"
    puts "1. Rock -- 2. Spock -- 3. Paper -- 4. Lizard -- 5. Scissors"
    print "Move: "
    while chosen_move < 1 || chosen_move > 5
      chosen_move = STDIN.noecho(&:gets).chomp.to_i
      puts
      if chosen_move < 1 || chosen_move > 5
        print "\nPlease enter 1-5: "
      end
    end
    return chosen_move
  end
end

class Game

  @@moves_array = {1=>"Rock",2=>"Spock",3=>"Paper",4=>"Lizard", 5=>"Scissors"}

  def initialize
    @player_count = 0
  end

  def intro
    puts "Welcome to Rock Paper Scissors Lizard Spock"
    puts "Please note that when inputing your move selection, your input will not appear on screen. This is to enchance two player mode."
    print"How many people are playing? "
    while @player_count < 1 || @player_count > 2      
      @player_count = gets.chomp.to_i
      if @player_count < 1 || @player_count > 2
        print "Please choose either one or two players: "
      end
    end
    player_init
  end

  def player_init
    if @player_count == 1
      print "What is your name? "
      player_one_name = gets.chomp
      @player_one = HumanPalyer.new(player_one_name)
      @player_two = ComputerPalyer.new
      puts "\nIt will be #{@player_one.name} v the #{@player_two.name}"
      one_player_get_moves
    else
      print "What is the first players name? "
      player_one_name = gets.chomp
      @player_one = HumanPalyer.new(player_one_name)
      print "What is the second players name? "
      player_two_name = gets.chomp
      @player_two = HumanPalyer.new(player_two_name)
      puts "\nIt will be #{@player_one.name} v #{@player_two.name}"
      two_player_get_moves
    end
  end

  def one_player_get_moves
    player_one_move = @player_one.player_move
    player_two_move = @player_two.cpu_move
    puts "\n#{@player_one.name} picked #{@@moves_array[player_one_move]}"
    puts "#{@player_two.name} picked #{@@moves_array[player_two_move]}"
    calculate_result(player_one_move, player_two_move)
  end

  def two_player_get_moves
    player_one_move = @player_one.player_move
    player_two_move = @player_two.player_move
    puts "\n#{@player_one.name} picked #{@@moves_array[player_one_move]}"
    puts "#{@player_two.name} picked #{@@moves_array[player_two_move]}"
    calculate_result(player_one_move, player_two_move)
  end

  def calculate_result(player_one_move, player_two_move)
    difference = (player_one_move - player_two_move) % 5
    if difference == 1 || difference == 2
      puts "#{@player_one.name} Wins!" 
    elsif difference == 3 || difference == 4
      puts "#{@player_two.name} Wins!"
    else
      puts "Its a tie" 
    end
    end_game
  end
  
  def end_game
    choice = 0

    puts "\nWhat would you like to do?"
    puts "1. Play another round"
    puts "2. Reset the game"
    puts "3. Quit"
    print "Choice: "

    while choice < 1 || choice > 3      
      choice = gets.chomp.to_i
      if choice < 1 || choice > 3
        print "Please choose one through 3: "
      end
    end

    if choice == 1
      if @player_count == 1
        one_player_get_moves
      else
        two_player_get_moves
      end
    elsif choice == 2
      puts "\n"
      newgame = Game.new
      newgame.intro
    else
      puts "\nThanks for playing"
      exit
    end      
  end
end

newgame = Game.new
newgame.intro