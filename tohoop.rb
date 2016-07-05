class Pole
  attr_accessor :array

  def initialize(n=3)
    @array = (1..n).to_a.reverse
    @array = @array.map do |num|
      disk = ""
      num.to_i.times {disk << "o"}
      disk
    end
  end

  def receive(n)
    @array.push(n)
  end

  def remove
    @array.pop
  end

end


class Game
  attr_accessor :size, :pole1, :pole2, :pole3, :move, :from, :to

  def initialize(n=3)
    @size = n
    @pole1 = Pole.new(n)
    @pole2 = Pole.new(0)
    @pole3 = Pole.new(0)
    ###@all_poles may not update when @pole1.array, etc updates
    @all_poles = [@pole1.array, @pole2.array, @pole3.array]
  end
  ################  RENDER
  def render
    one, two, three = [], [], []
    @size.times {one << "|"}
    @size.times {two << "|"}
    @size.times {three << "|"}

    @pole1.array.each_with_index do |x,i|
      one[i] = x.to_s
    end
    @pole2.array.each_with_index do |x,i|
      two[i] = x.to_s
    end
    @pole3.array.each_with_index do |x,i|
      three[i] = x.to_s
    end

    puts "\nCurrent Board:"
    @size.times do |i|
      print one[@size-i-1].ljust(@size+1)
      print two[@size-i-1].ljust(@size+1)
      puts three[@size-i-1].ljust(@size+1)
    end
    print "1".ljust(@size+1)
    print "2".ljust(@size+1)
    puts "3".ljust(@size+1)

  end ############  END RENDER


  def prompt
    valid = false
    while !valid
      valid = true
      puts "Enter your move in this format(1,3)"
      @move = gets.chomp
      if @move == "q"
        exit
      end
      @from = @move[0].to_i
      @to = @move[2].to_i
      if @from > 3 || @from < 1
        valid = false
      elsif @to > 3 || @to < 1
        valid = false
      elsif @all_poles[@from - 1].length == 0
        valid = false
      elsif @all_poles[@to - 1].length == 0
        break
      elsif @all_poles[@from - 1][-1].length > @all_poles[@to - 1][-1].length
        valid = false
      end

      puts "Invalid move. Try again." if valid == false
    end
  end

  def move
    @all_poles[@to - 1].push(@all_poles[@from - 1][-1])
    @all_poles[@from - 1].pop
  end


  def play
    puts "Welcome to Tower of Hanoi!"
    puts "Instructions:"
    puts "Enter where you'd like to move from and to"
    puts "in the format '#,#'. Enter 'q' to quit."
    until @pole2.array.length == @size || @pole3.array.length == @size
      render
      prompt
      move
    end
    puts "Great job!"
    render
  end
end

game = Game.new(25)
game.play
