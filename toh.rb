require 'pry'

class TowerOfHanoi
  def initialize height
    @height = height
    @linewidth = @height + 5
    @tower = (1..@height).to_a.reverse
    @win_if = (1..@height).to_a.reverse
    @columns = [ @tower, [], [] ]
  end

  def play
    introduction
    loop do
      render
      move
      break if @columns[@destination_column] == @win_if
    end
    render
  end

  def introduction
    puts
    puts
    puts "======================================================="
    puts "Welcome to Tower of Hanoi!"
    puts "Rules:"
    puts "1. Only one disk can be moved at a time."
    puts "2. Each move consists of taking the upper disk from one of the stacks and placing it on top of another stack i.e. a disk can only be moved if it is the uppermost disk on a stack."
    puts "3. No disk may be placed on top of a smaller disk."
    puts
    puts "Press 'q' to exit the game anytime."
    puts "Hit enter when you're ready to start!"
    gets
    puts "======================================================="
    puts
    puts
  end

  def render
    (@height - 1).downto(0).each do |row|
      puts
      @columns.each do |column|
        if column[row] == nil
          print " " * @linewidth
        else
          print ("o" * column[row]).ljust(@linewidth)
        end
      end
    end
    puts
    puts "1".ljust(@linewidth) + "2".ljust(@linewidth) + "3".ljust(@linewidth)
  end

  def congratulations
    print "\n\n\n\n\n\n"
    puts "Congratulations!!! You won :)"
    print "\n\n\n"
  end


end



game = TowerOfHanoi.new 3
game.play