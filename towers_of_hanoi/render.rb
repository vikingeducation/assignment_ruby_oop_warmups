module Render

  def welcome
    5.times { puts } 
    puts "Welcome to Tower of Hanoi!"
    puts "Instructions:"
    puts "Move a 'disk' in the format: 1,3 "
    puts
    puts "...and you can type 'quit'... well to quit!"
    puts
    puts "Visit: http://hanoi.aimary.com/index_en.php for a great detailed analysis on the game"
    puts
    puts "Let's begin!"
    puts
  end 


  def render
    lines = @discs - 1
    
    lines.downto(0) do |line|
      @peg1.stack[line].nil? ? peg1 = 0 : peg1 = @peg1.stack[line]
      @peg2.stack[line].nil? ? peg2 = 0 : peg2 = @peg2.stack[line]
      @peg3.stack[line].nil? ? peg3 = 0 : peg3 = @peg3.stack[line]
      
      puts ('[]' * peg1).center(20) + ('[]' * peg2).center(20) + ('[]' * peg3).center(20) 

    end
    puts "   ______________   " + "   ______________   " + "   ______________   "
    puts "  (====Post 1====)  " + "  (====Post 2====)  " + "  (====Post 3====)  "
    puts
  end 

  def tower_setup
    puts "How many discs do you want to play with?"
    discs = gets.chomp.to_i
    if discs > 8
      puts "Solving this with more than 8 discs would even be tedious for Superman!"
      puts "I took the liberty of giving you 8 discs. Don't ever say I never did nothin for you!"
      @discs = 8
    elsif discs < 3
      puts "You can't play, nor break my game that easy!"
      puts  "Sorry 3 discs is the minimum, I'll help you out and set the game to that"
      @discs = 3
    else
      @discs = discs
    end

    @peg1.stack = (1..@discs).to_a.reverse 
    @winning_sequence = @peg1.stack.dup

  end  


end