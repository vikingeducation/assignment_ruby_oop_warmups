class TowerOfHanoi
  SMALL_RING = 'O'.freeze
  MEDIUM_RING =  'OO'.freeze
  LARGE_RING =  'OOO'.freeze
  ALL_RINGS = [SMALL_RING, MEDIUM_RING, LARGE_RING].freeze
  BOARD_COLLUMNS = {
    1 => [1, 4, 7],
    2 => [2, 5, 8],
    3 => [3, 6, 9]
  }.freeze

  def board_initialize
    {
    1 => SMALL_RING,
    2 => '   ',
    3 => '   ',
    4 => MEDIUM_RING,
    5 => '   ',
    6 => '   ',
    7 => LARGE_RING,
    8 => '   ',
    9 => '   ',
  }
  end

  def prompt(message)
    puts "=> #{message}"
  end

  def clear_system
    system 'clear'
  end

  def winning_message(score)
    prompt "                                 "
    prompt "OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO"
    prompt "      That is a Big Tower        "
    prompt "* * * Great Job! YOU WIN!!! * * *"
    prompt "Your Score: #{score}"
  end

  def display_board(brd)
    puts "    Current Board                "
    puts " #{brd[1]}   #{brd[2]}  #{brd[3]}    "
    puts " #{brd[4]}   #{brd[5]}  #{brd[6]}    "
    puts " #{brd[7]}   #{brd[8]}  #{brd[9]}    "
    puts "                "
    puts "                "
    puts " 1     2     3  "
    puts "----------------"
  end

  def freeze
    sleep(1.5)
  end

  def welcome_message
    puts "*********************************************"
    puts "   Hello! Welcome to Tower of Hanoi Game"
    puts "*********************************************"
  end

  def play_game?
    player_input = gets.chomp.to_s.downcase
    loop do
      if player_input == 'y'
        break
      elsif player_input == 'n'
        prompt "Goodbye!!!"
        exit
      else
        prompt "Please enter a valid answer"
        prompt "('y' for 'yes')"
        prompt "('n' for 'no')"
        player_input = gets.chomp.to_s.downcase
      end
    end
  end

  def render_board(current_col, new_col, brd)
    ring = ' '
    BOARD_COLLUMNS[current_col].reverse.each do |pos|
     if ALL_RINGS.include?(brd[pos])
       ring = brd[pos]
       brd[pos] = '   '
       break
     end
    end
     BOARD_COLLUMNS[new_col].each do |pos|
       if brd[pos] == '   '
         brd[pos] = ring
         break
       end
     end
  end

  def current_collumn_valid?(col, brd)
    (col <= 3 && col >= 1) && curr_col_has_rings?(col, brd)
  end

  def curr_col_has_rings?(col, brd)
   BOARD_COLLUMNS[col].each {|pos| return true if ALL_RINGS.include?(brd[pos])}
   false
  end

  def new_collumn_valid?(col, brd)
    return true if (col <= 3 && col >= 1) && new_col_has_space?(col, brd)
    false
  end

  def new_col_has_space?(col, brd)
    ALL_RINGS.include?(brd[BOARD_COLLUMNS[col][-1]]) == false
  end

  def player_win?(brd)
    tower = []
    BOARD_COLLUMNS.values.each do |arr|
      tower = []
      arr.each do |pos|
        tower << brd[pos]
      end
      return true if tower == ALL_RINGS
    end
    false
  end

  def start_coll_not_winning_coll?(brd)
    tower = []
    BOARD_COLLUMNS[1].each do |pos|
     tower << brd[pos]
    end
    return true if tower != ALL_RINGS
    false
  end

  def goodbye_message
    puts "*^*^*^*^*^*^*^*^*^*^*^"
    puts "Thank you for playing"
    puts "      Goodbye!       "
    puts " *_*_*_*_*_*_*_*_*_*"
  end

  def play
    clear_system
    welcome_message
    freeze
  
    prompt "Would you like to play (y/n)"
    play_game?
    player_score = 0
  
    loop do #outer loop
      board = board_initialize
      loop do #inner loop
        clear_system
        display_board(board)
        prompt "Enter move"
        current_collumn = gets.chomp.to_i
        prompt "Enter new place"
        new_collumn = gets.chomp.to_i
  
        if current_collumn_valid?(current_collumn, board) && new_collumn_valid?(new_collumn, board)
          render_board(current_collumn, new_collumn, board)
        else
          prompt "Invalid Entry"
        end
  
        if start_coll_not_winning_coll?(board) && player_win?(board)
          clear_system
          break
        end
      end
      display_board(board)
      player_score += 1
      winning_message(player_score)
      prompt "Would you like to play again?"
      prompt "(y => yes, n => no)"
      answer = gets.chomp.to_s.downcase
      break unless answer.downcase == 'y'
    end
  
    goodbye_message
  end
end

t = TowerOfHanoi.new
t.play