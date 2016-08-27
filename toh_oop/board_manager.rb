require "./setup_game"
require "./render"
require "./validator"

class BoardManager


  def update_cols(col_a, col_b, col_c)

    active_cols = Hash.new
    active_cols[1] = col_a
    active_cols[2] = col_b
    active_cols[3] = col_c
    active_cols

  end

#----------

  def remove_from_col(col)

    i = col.count(' ')
    col[i] = ' '

    col

  end

#----------

  def add_to_col(from_col, to_col)

    from_index = from_col.count(' ')
    to_index = to_col.count(' ') - 1

    to_col[to_index] = from_col[from_index]

    to_col
  end

#----------

  def update_game(active_cols, player_move)

    f = player_move[0].to_i
    t = player_move[1].to_i

    from = active_cols[f]
    to = active_cols[t]

    active_cols[t] = add_to_col(from, to)
    active_cols[f] = remove_from_col(from)

    return active_cols

  end

#----------


  def check_for_win(col_a, col_b, col_c, tower_height, min_turns, current_turn, winning_board)

    if col_c[0] == winning_board[0]
      puts "You win the game!"
      puts "It took you #{current_turn} turns.  The minumum was #{min_turns}."
      return true
    else
      return false
    end

  end

  #----------

  def get_player_move

    print "Make your move! \n>>"
    player_move = gets.chomp
    player_move = player_move.split(",")
    player_move

  end

#----------

  def game_loop

    setup = SetupGame.new
    render = Render.new
    validate = Validator.new

    @current_turn = 0
    @tower_height = setup.start_game
    @min_turns = 2**@tower_height - 1
    @game_over = false
    @winning_board = setup.init_col_a(@tower_height)
    
    puts "\nThe minimum number of turns to win with a tower #{@tower_height} units tall is: #{@min_turns}."
    puts "Think you can do it?"

    @col_a = setup.init_col_a(@tower_height)
    @col_b = setup.init_empty_cols(@tower_height)
    @col_b.push("2")
    @col_c = setup.init_empty_cols(@tower_height)
    @col_c.push("3")

    @active_cols = update_cols(@col_a, @col_b, @col_c)
    render.display_game_board(@active_cols, @tower_height)
  
    until @game_over

      @player_move = []
      @current_turn += 1
      @player_move = get_player_move

      @syntax_error_free = validate.valid_syntax?(@active_cols, @tower_height, @player_move)
      @stack_error_free = validate.valid_move?(@active_cols, @tower_height, @player_move)
      puts "Please make a correct move.  You may not move a larger stack onto a smaller stack"
      puts "and valid column numbers are 1, 2, 3.  Try again."


      until @syntax_error_free && @stack_error_free
        @player_move = get_player_move
        @syntax_error_free = validate.valid_syntax?(@active_cols, @tower_height, @player_move)
        @stack_error_free = validate.valid_move?(@active_cols, @tower_height, @player_move)
        puts "Please make a correct move.  You may not move a larger stack onto a smaller stack"
        puts "and valid column numbers are 1, 2, 3.  Try again."
      end

      exit if @player_move[0] == 'q'

      @active_cols = update_game(@active_cols, @player_move)
      render.display_game_board(@active_cols, @tower_height)

      @game_over = check_for_win(@col_a, @col_b, @col_c, @tower_height, @min_turns, @current_turn, @winning_board) if @current_turn >= @min_turns
 
    end

  end


end

bm = BoardManager.new
bm.game_loop