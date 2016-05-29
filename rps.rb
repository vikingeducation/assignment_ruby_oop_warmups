class Rps 
  attr_reader :p1_s, :p2_s, :r_w, :p1, :p2
  def initialize(player1, player2, require_win)
    @p1 = player1
    @p2 = player2
    @r_w = require_win
    @p1_s = 0
    @p2_s = 0
    @round = 1
    @p1_a = ""
    @p2_a = ""
  end
  def get_answer
    if @round.even?
      puts "#{@p2}, Please enter your choice!"
      @p2_a = gets.chomp
      puts "Choice Entered"
      puts "#{@p1}, Please enter your choice!"
      @p1_a = gets.chomp
      puts "Choice Entered"
    else
      puts "#{@p1}, Please enter your choice!"
      @p1_a = gets.chomp
      puts "Choice Entered"
      puts "#{@p2}, Please enter your choice!"
      @p2_a = gets.chomp
      puts "Choice Entered"
    end
    @round += 1
  end
  def get_result
    if @p1_a == "r" and @p2_a == "p"
      @p2_s += 1
      puts "Been here"
    elsif @p1_a == "r" and @p2_a == "s"
      @p1_s += 1
    elsif @p1_a == "p" and @p2_a == "r"
      @p1_s += 1
    elsif @p1_a == "p" and @p2_a == "s"
      @p2_s += 1
    elsif @p1_a == "s" and @p2_a == "r"
      @p2_s += 1
    elsif @p1_a == "s" and @p2_a == "p"
      @p1_s += 1
    end
    @p1_a = ""
    @p2_a = ""
    puts @p1_s
    puts @p2_s
  end
end

rps = Rps.new("Bill","Chan",2)
while rps.p1_s < rps.r_w and rps.p2_s < rps.r_w
  rps.get_answer
  rps.get_result
end
if rps.p1_s == rps.r_w
  puts "#{rps.p1} win!"
elsif rps.p2_s == rps.r_w
  puts "#{rps.p2} win!"
end
