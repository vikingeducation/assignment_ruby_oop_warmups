class Player
  attr_accessor :name

  def initialize(name = 'Mystery Player', towers)
    @name = name
    @towers = towers
  end

  def get_move
    loop do
      move = ask_for_move

      # TODO: allow for quitting
      # if player_quit?(move)
      #   quit
      # else
      if current_move = parse_move(move)

        if valid_move_format?(current_move)
          break if @towers.place_disk(current_move)
        end
      end
    end
  end

  def ask_for_move
    puts "Enter move > "
    gets.chomp
  end

  def player_quit? move
    move == 'q' || move == 'quit'
  end

  def parse_move move
    move.split(',').map(&:to_i)
  end

  def valid_move_format? move
    if move.is_a?(Array) && move.size == 2
      true
    else
      puts "Your move is improperly formatted"
    end
  end

end