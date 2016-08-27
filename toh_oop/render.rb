class Render

  def display_game_board(active_cols, tower_height)

    col_a = active_cols[1]
    col_b = active_cols[2]
    col_c = active_cols[3]


    for i in 0..tower_height do
      puts "\t#{col_a[i]}\t#{col_b[i]}\t#{col_c[i]}"
    end

  end

#----------



end