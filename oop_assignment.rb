def reverse(string)
  result = ""
  counter = string.length-1
  while counter >= 0
    result += string[counter]
    counter -= 1
  end
  result
end

def fibs(num)
  result = [0,1]
  return [0] if num == 1
  while result.length < num
    to_be_pushed = result[-1] + result[-2]
    result.push to_be_pushed
  end
  result
end

def my_benchmark(number_of_times)
  start_time = Time.now
  number_of_times.times do
    yield
  end
  Time.now - start_time
end

class Array
  
  def my_each(prc=nil)
    counter = 0
    if block_given?
      while counter < length
        yield self[counter]
        counter += 1
      end
    else
      return nil if !prc
      while counter < length
        prc.call self[counter]
        counter += 1
      end
    end
    self
  end

  def my_map(&block) 
    result = []
    my_each { |e| result.push (block.call e)}
    result
  end

  def my_select(&block)
    result = []
    my_each { |e| result.push e if block.call(e) }
    result
  end

  def my_all?(&block)
    my_each { |e| return false if !block.call(e) }
    return true
  end

  def my_inject(start, &block)
    current = start
    my_each { |e| current = block.call(current,(e)) }
    current
  end

end

class Game
  def initialize
    @playing=true
    welcome
  end

  MOVES={rock: :scissors, paper: :rock, scissors: :paper}

  def welcome
    puts "Welcome to the game. Enter your name:"
    @player_1=Player.new(gets.chomp)
    puts "How many players?"
    input=gets.chomp.to_i
    if input== 1
      @player_2=Player.new(:computer)
    else
      puts "Enter Player 2's name:"
      @player_2=Player.new(gets.chomp)
    end
  end

  def play
    while @playing   
      player_1_move=@player_1.move
      player_2_move=@player_2.move
      @playing=!win_check(player_1_move,player_2_move)
    end
    puts "#{@winner} won!"
  end

  def win_check(a,b)
    if b.to_sym==MOVES[a.to_sym]
      @winner=@player_1.name
      return true
    elsif a.to_sym==MOVES[b.to_sym]
      @winner=@player_2.name
      return true
    else
      puts "It's a tie!"
      return false
    end
  end
end

class Player
  attr_reader :name
  def initialize(input)
    case input
      when String
        @mode=:human
        @name=input
      when Symbol
        @mode=:computer
        @name="Computron"
    end 
  end

  def move
    case @mode
      when :human
        begin 
          puts "#{@name}, enter your move:"
          @move=gets.chomp
          raise if !validate
        rescue StandardError
          puts "Invalid Entry"
          retry
        end
      when :computer
        @move=["rock","paper","scissors"].sample
        puts "Computron chooses #{@move}"
    end 
    return @move
  end

  def validate
    !!/\A(rock|paper|scissors)/i.match(@move)
  end
end


def test_warmups
  puts (reverse "hello") == "olleh"
  puts fibs(3) == [0,1,1]
  puts fibs(8) == [0,1,1,2,3,5,8,13]
  puts my_benchmark(10000) { puts "hi" } 
  my_proc = Proc.new{|item| puts item**2}
  puts [1,2,5].my_each my_proc
  puts [1,2,5].my_map {|item| puts item**2}
  my_proc = Proc.new{|item| item.even?}
  puts [1,2,5].my_select(&my_proc)
  my_proc = Proc.new{|item| item.even?}
  puts [1,2,5].my_all?(&my_proc)
  puts [1,2,5].my_inject(0) { |memo, item| memo + item }
end

def test_rps
  app=Game.new
  app.play
end

class Tower

  def initialize(data)
    @database=data
  end

  def empty?
    @database.empty?
  end

  def top_disc
    @database.last unless empty?
  end

  def remove_disk
    @database.pop
  end

  def add_disk(disk)
    @database << disk
  end

  def valid_move?(to_tower)
    !empty? && (to_tower.empty? || to_tower.top_disc > top_disc)
  end

  def win?
    @database==[7,5,3]
  end

  def print_tower
    @database.to_s
  end

  def make_visuals
    out = ""
    @database.each_with_index do |v,i|
      spaces = make_spaces(i)
      ring = make_ring(v)
      out = spaces + ring + out 
    end
    out
  end

  def make_spaces(idx)
    out = ''
    idx.times do
      out += ' '
    end
    out
  end

  def make_ring(v)
    out = ''
    v.times do
      out += '#'
    end
    out + "\n"
  end

end

#disks (data)
#empty?
#top_disc
#valid_move?
#remove disk
#add disk

class Tower_Game
  
  def initialize
    @towers={
      'first' => Tower.new([7,5,3]), 
      'second' => Tower.new([]),
      'third' => Tower.new([])
    }
    welcome
  end

  private
    def welcome
      puts "Welcome to the Tower of Hanoi game."
      puts "Please enter your name:"
      @name=gets.chomp
      play
    end

    def play
      until check_win
        begin
          get_choices
          check_choices
          execute_choices
        rescue StandardError
          puts "Invalid choices. Try again."
          retry
        end
      end
      render
      puts "Congratulations, #{@name}!"
    end

    def get_choices
      render
      puts "Grab which one?"
      @from=gets.chomp
      puts "Place it where?"
      @to=gets.chomp
    end

    def check_choices
      raise if !(@towers[@from].valid_move? @towers[@to])
    end

    def execute_choices
      @towers[@to].add_disk(@towers[@from].remove_disk)
    end

    def check_win
      @towers['third'].win?
    end

    def render
      @towers.each do |k,v| 
        visuals = v.make_visuals
        puts "||||#{k}||||\n#{visuals}"
      end
    end

# ' #####\n'  
# '#######'

end

  ###      [2,3]
 #####     [1,5]
#######    [0,7]

def test_toh
  app=Tower_Game.new
end

test_toh


#prompt user for "from tower"
#store that choice in a buffer
#remove topmost ring from tower of choice
#prompt user for "to tower"
#check if destination is empty
#if not empty, check if topmost ring in destination tower 
#is greater than the ring being held in the buffer
#if it is, place the buffer on the tower of choice





