class Player (name)
  attr_accessor :set

  def initialize
    @name=name
    @cards=[1,2,3,4,5,6,7,8,9,10,10,10,10]
    @set=[@cards[rand(0..@cards.length-1)],@cards[rand(0..@cards.length-1)]]
  end

  def add_card
    @set<<@cards[rand(0..@cards.length-1)]
  end

  def result
    @set.inject(0){|sum,item| sum+item}
  end

  def check
    if result == 21 
      puts "#{@name} won!"
    elsif 
      result > 21
      puts "#{@name} lose!"
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

    
    puts "More cards?"
    answer=gets.chomp #y

    if answer=="y"
      player.add_card
      player.check

      puts player.set
      puts player.result
    else
      puts player.result
    end

    computer=Player.new("Computer")
    computer.check
    
    winner
  end

  def winner
    if player.result > computer.result
      puts "You won!"
    else
      puts "Computer won!"
    end
  end

end


