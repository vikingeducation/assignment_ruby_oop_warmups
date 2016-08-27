

class SetupGame

  def start_game

    puts "############################################################"
    puts "#                                                          #"
    puts "#\tWelcome to Towers of Hanoi!!                       #"
    puts "#                                                          #"
    puts "#\tInstructions:                                      #"
    puts "#\tEnter where you'd like to move from and to         #"
    puts "#\tin the format '1,3'.  Enter 'q' to quit.           #"
    puts "#                                                          #"
    puts "############################################################"
    puts "\n\tHow tall will your tower be?\n>> "
    @tower_height = gets.chomp

    return @tower_height.to_i
  end

#----------

  def init_col_a(tower_height)
    col_a = []

    for i in 1..tower_height do
      col_a[i-1] = "o" * i
    end

    col_a.push("1")
    col_a
  end

#---------

  def init_empty_cols(tower_height)
    cols = []

    for i in 1..tower_height do
      cols[i-1] = " "
    end
    cols
  end

#----------  


end