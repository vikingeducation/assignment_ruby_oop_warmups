class Pole
  attr_accessor :array

  def initialize(n=3)
    @array = (1..n).to_a.reverse
  end

  def receive(n)
    @array.push(n)
  end

  def remove
    @array.pop
  end

end


class Game
  attr_accessor :size, :pole1, :pole2, :pole3

  def initialize(n=3)
    @size = n
    @pole1 = Pole.new(n)
    @pole2 = Pole.new(0)
    @pole3 = Pole.new(0)
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

  def play
    puts "Welcome to Tower of Hanoi!"
    puts "Instructions:"
    puts "Enter where you'd like to move from and to"
    puts "in the format '#,#'. Enter 'q' to quit."
  end


end

game = Game.new
puts game.pole1.array
puts game.render
