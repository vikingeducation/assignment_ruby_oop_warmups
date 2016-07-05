def my_reverse(string)
  array = string.split("")
  new_array = []
  array.each do |x|
    new_array.unshift(x)
  end

  new_string = new_array.join("")
  return new_string
end

def fibs(n)
  fib_array = [0, 1, 1]
  until fib_array.length == n
    fib_array << fib_array[-1] + fib_array[-2]
  end

  return fib_array
end

#puts fibs(10)

def my_benchmark(n, &block)
  time1 = Time.now
  n.times do
    block.call
  end

  Time.now-time1
end


class Array
  def my_each(my_proc)
    self.length.times do |i|
      my_proc.call(self[i])
    end
  end

  def my_map(my_proc)
    my_array = []
    self.length.times do |i|
      my_array << my_proc.call(self[i])
    end
    p my_array
  end

  def my_select
    new_array = []
    self.length.times do |i|
      new_array <<  self[i] if yield(self[i])
    end
    p new_array
  end

  def my_all?
    check = []
    self.length.times do |i|
      check << yield(self[i])
    end
    if check.include?(false)
      puts false
    else
      puts true
    end
  end

  def my_inject(num)
    total = num
    self.length.times do |i|
      total = yield(total, self[i])
    end
    p total
  end
end
  
my_proc = Proc.new {|item| item ** 2}

#[1,2,5].my_select {|item| item < 5}
#[1,2,3].my_all? {|item| item < 5}
#[1,2,5,5].my_inject(1) {|item1, item2| item1 + item2}


class Game
  def initialize(player)
    @player1 = player
    puts "We are going to play Rock-paper-scissor, #{player.name}"
  end

  def check_round(choice1, choice2)
    if choice1 == "rock" && choice2 == "paper"
      puts "#{choice2} wins!"
      return true
    elsif choice1 == "paper" && choice2 == "rock"
      puts "#{choice1} wins!"
      return true
    elsif choice1 == "rock" && choice2 == "scissors"
      puts "#{choice1} wins!"
      return true
    elsif choice1 == "scissors" && choice2 == "rock"
      puts "#{choice1} wins!"
      return true
    elsif choice1 == "rock" && choice2 == "rock"
      puts "No one won :("
        return true
    elsif choice1 == "paper" && choice2 == "scissors"
      puts "#{choice2} wins!"
      return true
    elsif choice1 == "scissors" && choice2 == "paper"
      puts "#{choice1} wins!"
      return true
    elsif choice1 == "paper" && choice2 == "paper"
      puts "No one wins :("
        return true
    elsif choice1 == "scissors" && choice2 == "scissors"
      puts "No one wins :("
        return true
    end
  end

    def round
    end
end


class Player

  attr_accessor :name, :choice

  def initialize
    puts "Player 1. What is your name?"
    @name= gets.chomp
    @choice = ""
  end
end


class Computer

  def initialize
  end

  def pick_random
    choices = ["rock", "paper", "scissors"]
    return choices.sample
  end
end


game = Game.new(Player.new)
