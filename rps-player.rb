class Player

  def initialize(human=false)
    @human = human
    @choices = %w(rock paper scissors)
  end


  def throw(num)
    if @human
      loop do
        puts 
        puts "Rock, paper, scissors..."
        print "Player #{num}> "
        move = gets.chomp.downcase.gsub(/\s+/, "")
        if @choices.include?(move)
          return move
        else
          puts "Please submit rock, paper, or scissors."
        end
      end
    else
      move = @choices.sample
      puts "Player 2 threw #{move}!"
      puts
      move
    end
  end

end