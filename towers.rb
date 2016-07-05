class TowerOfHanoi
  def initialize(n=3)
    @size = n
    @left = (1..n).to_a.reverse

    @left = @left.map do |x|
      disk = ""
      x.times {disk << "o"}
      disk
    end
    @key = @left
    @middle = []
    @right = []
    @from = 0
    @to = 0

    @rods = ["", @left, @middle, @right]
  end




  #class variables


  #methods

  def render  ########################
    n = @size
    one, two, three = [], [], []
    n.times {one << ""}
    n.times {two << ""}
    n.times {three << ""}

    @left.each_with_index do |x,i|
      one[i] = x
    end
    @middle.each_with_index do |x,i|
      two[i] = x
    end
    @right.each_with_index do |x,i|
      three[i] = x
    end

    puts "\nCurrent Board:"
    @size.times do |i|
      print one[n-i-1].ljust(n+1)
      print two[n-i-1].ljust(n+1)
      puts three[n-i-1].ljust(n+1)
    end
    print "1".ljust(n+1)
    print "2".ljust(n+1)
    puts "3".ljust(n+1)
  end  #######    RENDER

  def prompt#######################
    valid = false
    while !valid
      valid = true
      print "Enter move > "
      temp = gets.chomp
        if temp =="q"
          @from = "q"
          valid = true
          break
        end

      @from = temp[0].to_i
      @to = temp[2].to_i
      if @from > 3 || @from < 1
        valid = false
      elsif @to > 3 || @to < 1
        valid = false
      elsif @rods[@from].length == 0
        valid = false
      elsif @rods[@to].length == 0
        break
      elsif @rods[@from][-1].length > @rods[@to][-1].length
        valid = false
      end

      puts "Invalid move. Try again." if valid == false
    end
  end #####################################3   PROMPT

  def move(a,b)################
    if @from!="q"
      @rods[@to].push(@rods[@from][-1])
      @rods[@from].pop
    end
  end############    MOVE

  def valid?(array) ######

  end   ########   VALID?

  def over? ###########

    if @middle == @key || @right == @key || @from =="q"
      return true
    else
      return false
    end
  end  #####   OVER?


    def play#######################################
      puts "Welcome to Tower of Hanoi!"
      puts "Instructions:"
      puts "Enter where you'd like to move from and to"
      puts "in the format '#,#'. Enter 'q' to quit."

      while !self.over?
        self.render
        self.prompt
        self.move(@from,@to)

      end

      if @from =="q"
        puts "Thanks for playing!"
      else
        self.render
        puts "You Win!!!"
      end

    end   #######     PLAY
end ####  CLASS
