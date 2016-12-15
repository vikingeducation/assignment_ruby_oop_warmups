class TowerOfHanoi

  def initialize(height) #Set height as arugment passed when   creating object and the pillars as an array of 3 empty array's.
    @height = height 
    @pillars = [[],[],[]]
  end

  def play #Game starts with a call to this method. Display Instructions and call game_init.
    puts "Welcome to Tower of Hanoi!"
    puts "By Cameron Watson"
    puts "Instructions:"
    puts "Enter where you'd like to move from and to in the format '1,3'"
    puts "Enter 'q' to quit."
    puts "Now lets start the game!!!"
    game_init
  end

  def game_init #fills up pillars[0] (the first sub-array) with the starting pieces based on the height varaible. It is filled with integers in decending order. The smaller the number the smaller the game piece is. 

  #After filling the sub-array it creates a duplicate off it to be used later as a comparsion for the win condition. Then calls render method to show the starting board.  
    @height.downto(1) do |x|
      @pillars[0] << x
    end
    @win_comb = @pillars[0].dup
    render
  end

  def get_move #Ask player for there next move in 1,3 format. 
    puts "\nWhat move would you like to make?"
    @players_move = gets.chomp

    if @players_move == "q" || @players_move == "quit"  #Will exit if q is entered
      exit

    elsif @players_move.length > 3 ||  
          @players_move.length < 1 || 
          @players_move[0].to_i > 3 || 
          @players_move[0].to_i < 1 || 
          @players_move[0].to_i == @players_move[2].to_i ||          
          @players_move[1] != "," ||     
          @players_move[2].to_i > 3 || 
          @players_move[2].to_i < 1  
      puts "Invalid Move - Please try again"
      get_move

    elsif @pillars[(@players_move[0].to_i-1)].empty?
      puts "Invalid Move, there is nothing to move from Pillar #{@players_move[0]}"
      get_move

    else
      make_move
    end
  end

  def make_move #Moves the piece based on palyer input
    move_from_pillar = (@players_move[0].to_i - 1)
    move_to_pillar = (@players_move[2].to_i - 1)
    piece_to_move = @pillars[move_from_pillar][-1]

    if @pillars[move_to_pillar][-1].nil? || piece_to_move < @pillars[move_to_pillar][-1] 
      @pillars[move_from_pillar].pop[-1]
      @pillars[move_to_pillar] << piece_to_move
      render
    else
      puts "Invalid Move - You cannot put a piece on a smaller piece"
      get_move #If the move made is not allowed - display message and get another move
    end
  end

  def render #Draws the current board after the last move has been made.
    puts "Current Board"    
    (@height-1).downto(0) do |pos|
      puts "|" + ("o" * @pillars[0][pos].to_i + " " * (@height - @pillars[0][pos].to_i)) + "|" + ("o" * @pillars[1][pos].to_i+ " " * (@height - @pillars[1][pos].to_i)) + "|" + ("o" * @pillars[2][pos].to_i+ " " * (@height - @pillars[2][pos].to_i)) + "|"
    end
    check_win
  end

  def check_win #After each move checks to see if the game has been won by comparing sub array 2 (Pillar 3) to the win_comb set up in game init. If it has been won exit if not get another move.
    if @pillars[2] == @win_comb
      puts "You Win!!"
      exit
    else get_move
    end
  end
end

new_game = TowerOfHanoi.new(5)
new_game.play

