require 'pry'

class Game
  attr_reader :p1, :p2, :number_of_players

  def initialize
    new
  end

  def new
    puts "Welcome to Rock, Paper, Scissors!"
    puts "(Enter q at any time to quit.)\n\n"
    puts "\nPlease enter the number of players: "

    # Determine number of players
    while true
      @number_of_players = gets.chomp.to_i
      break if @number_of_players == 1 || @number_of_players == 2
      puts "\nError: invalid number of players. Please enter 1 or 2: "
    end

    # Initialize players
    if @number_of_players == 1
      puts "\nPlayer 1: "
      @p1 = Human.new(@name)
      puts "\nComputer: "
      @p2 = Computer.new(@name)
    elsif @number_of_players == 2
      puts "\nPlayer 1: "
      @p1 = Human.new(@name)
      puts "\nPlayer 2: "
      @p2 = Human.new(@name)
    end

    get_moves
  end

  def get_moves
    puts "\nYour move, #{@p1.name}: "
    puts "(Enter rock, paper, or scissors)\n"
    @p1_move = @p1.move

    if @p2.class == Human
      puts "\nYour move, #{@p2.name}: "
      puts "(Enter rock, paper, or scissors)\n"
      @p2_move = @p2.move
      if invalid?(@p2.move)
        puts "\nError! Invalid input"
        get_moves
      end
    else
      @p2_move = @p2.move
    end

    evaluate_move(@p1_move, @p1)
    evaluate_move(@p2_move, @p2)

    won?
  end

  def evaluate_move(input, player)
    if input == "q"
      exit
    else
      puts "\n#{player.name} chose #{input}."
    end
  end

  def invalid?(input)
    true unless input == ("rock" || "paper" || "scissors" || "q")
  end

  def won?
    if (@p1_move == "rock" && @p2_move == "scissors") || (@p1_move == "paper" && @p2_move == "rock") || (@p1_move == "scissors" && @p2_move == "paper")
      puts "\n#{@p1.name} wins!\n"
    elsif (@p1_move == "rock" && @p2_move == "paper") || (@p1_move == "paper" && @p2_move == "scissors") || (@p1_move == "scissors" && @p2_move == "rock")
      puts "\n#{@p2.name} wins!\n"
    else
      puts "\nDraw...\n"
    end

    over
  end

  def over
    while true
      puts "\nPlay again? (y/n)\n"
      play_again = gets.chomp.downcase
      if play_again == "y"
        new
      elsif play_again == "n"
        puts "Bye!"
        exit
      else
        puts "Error: please enter 'y' or 'n'"
      end
    end
  end
end

class Player
  attr_accessor :name, :move

  def initialize(name)
    @name = gets.chomp
  end
end

class Human < Player
  def move
    @move = gets.chomp.downcase
  end
end

class Computer < Player
  def move
    decision_array = ["rock", "paper", "scissors"]
    @move = decision_array.sample
  end
end
