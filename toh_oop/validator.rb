class Validator

  def valid_syntax?(active_cols, tower_height, player_move)

    if player_move[0] == "q"
      error_free = true
      return error_free
    end

    a = player_move[0]

    from_col = active_cols[a.to_i]

    return false if (player_move[1].to_i > 3) || (player_move[0].to_i > 3) || (player_move[0].to_i < 1)

    if from_col[tower_height-1] != ' ' && from_col[tower_height] != a.to_i
      error_free = true
    else
      error_free = false
    end

    error_free
  end

#----------

  def valid_move?(active_cols, tower_height, player_move)

    if player_move[0] == "q"
      error_free = true
      return error_free
    end

    a = player_move[0].to_i
    b = player_move[1].to_i

    if (player_move[0].to_i < 1 || player_move[0].to_i > 3) || (player_move[1].to_i < 1 || player_move[1].to_i > 3)
      puts "Valid moves only 1-3, ex. '1,3'"
      return false
    end

    from_col = active_cols[a]
    to_col = active_cols[b]

    if from_col[from_col.count(' ')] > to_col[to_col.count(' ')]
      error_free = false
    else
      error_free = true
    end

    error_free = true if to_col[tower_height - 1] == " "

    error_free
  end


end