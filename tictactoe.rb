class Game_Square
  STATES = [:empty, :x, :o]
  def initialize
    @state = :empty
  end

  def state
    @state
  end

  def set_state(new_state)
    if @state != :empty
      puts("\n * Unallowed, box not empty * \n") # return nil
    elsif STATES.include?(new_state)
      @state = new_state
    else
      puts("exception, improper value") # shouldn't happen return nil
    end
  end
end

class Game_Board
  PAWNS = {:empty => " ", :x => "X", :o => "0"}
  VERT = "|"
  HORZ = "-"*12

  def initialize
    @boxes = []
    9.times do
      @boxes << Game_Square.new
    end
  end

  def boxes(i)
    if i < 1 || i > 9
      puts("exception, that index was out of bounds 0..8")
    else
      @boxes[i-1].state
    end
  end

  def set_box(i, new_state)
    if i < 1 || i > 9
      puts("exception, that index was out of bounds 0..8")
    else
      @boxes[i-1].set_state(new_state)
    end
  end

  def display
    puts("\n")
    puts(" #{PAWNS[boxes(1)]} #{VERT} #{PAWNS[boxes(2)]} #{VERT} #{PAWNS[boxes(3)]}")
    puts("#{HORZ}")
    puts(" #{PAWNS[boxes(4)]} #{VERT} #{PAWNS[boxes(5)]} #{VERT} #{PAWNS[boxes(6)]}")
    puts("#{HORZ}")
    puts(" #{PAWNS[boxes(7)]} #{VERT} #{PAWNS[boxes(8)]} #{VERT} #{PAWNS[boxes(9)]}")
    puts("\n")
  end

  def won?(piece_put)
    routes = [ [1,2,3], [4,5,6], [7,8,9], [1,4,7], [2,5,8], [3,6,9], [1,5,9], [3,5,7] ]
    routes.any? { |route| route.all? { | square | boxes(square) == piece_put }}
  end
end

class Player
  def initialize(first_player)
    first_player ? @game_piece = :x : @game_piece = :o
    @player_name = ""
    until @player_name != "" do
      print("\nPlease enter your name: > ")
      @player_name = gets.chomp
    end
  end

  def name
    @player_name
  end

  def game_piece
    @game_piece
  end
end

game = Game_Board.new

puts("The game is about to start,\n Enter your name, then place your piece by typing the box number.")
puts("These are:")
puts("1 2 3")
puts("4 5 6")
puts("7 8 9")

players = [Player.new(true), Player.new(false)]

piece_put = players[0].game_piece # just to initialize the loop
player_index = 1 # this will turn into 0 as soon as we enter the loop

moves = 0

until game.won?(piece_put) || moves == 9 do
  player_index == 1 ? player_index = 0 : player_index = 1 # switch player
  player = players[player_index]
  piece_put = player.game_piece
  game.display # display the game board
  print("\n #{player.name}, it's your turn. Put your piece in any of the empty boxes.")
  move = nil # explicit
  until move != nil do
    box_chosen = gets.chomp.to_i
    move = game.set_box(box_chosen, piece_put)
  end
  moves += 1
end

game.display
moves == 9 ? puts("It's a draw, as usual") : puts("You won, #{player.name}")
