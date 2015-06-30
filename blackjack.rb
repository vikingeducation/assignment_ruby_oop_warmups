class Player 
  attr_accessor :set

  def initialize(name)
    @name=name
    @cards=[1,2,3,4,5,6,7,8,9,10,10,10,10]
    @set=[@cards[rand(0..@cards.length-1)],@cards[rand(0..@cards.length-1)]]
  end

  def add_card
    @set << @cards[rand(0..@cards.length-1)]

  end

  def result
    aces = @set.select {|item| item == 1} 
    total = @set.inject(0){|sum,item| sum+item}
    aces.inject(total) {|sum, item| sum if sum+10<21}
  end

  def check
    if result == 21 
      puts "#{@name} won! #{@name} got 21."
      exit
    elsif 
      result > 21
      puts "#{@name} lose! #{@name} got #{result}."
      exit
    end
  end

end

class Game
  def initialize
    @cards=[1,2,3,4,5,6,7,8,9,10,10,10,10]
  end

  def begin
    player=Player.new("Player")
    player.check

    answer="y"

    while answer=="y" 
      puts "More cards?"
      answer=gets.chomp #y
      player.add_card


      puts player.result
      player.check

    end
      
    puts player.result

    computer=Player.new("Computer")
    computer.check

    while computer.result <= 16
      computer.add_card
    end
    computer.check

    winner(player, computer)
  end

  def winner(player, computer)
    if player.result > computer.result
      puts "You won! You got #{player.result}."
    else
      puts "Computer won! Computer  got #{computer.result}"
    end
  end

end


