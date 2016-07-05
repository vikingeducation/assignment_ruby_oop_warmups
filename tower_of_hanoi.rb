class TowerOfHanoi

#instance variables: 
# => board
# => first_rod

#methods:
# => play
# => turn
# => render
# => valid_move
# => move
# => win

def initialize(no_of_discs) 
  @first_rod = []
  counter = 1
  while counter <= no_of_discs 
    @first_rod.unshift(counter)
    counter += 1
  end
  @board = [ @first_rod,[],[] ]
end

def play 
  puts "Welcome to Tower of Hanoi!"
  render
  turn
end

def render
  puts "First rod: #{@board[0]}"
  puts "Second rod:  #{@board[1]}"
  puts "Third rod: #{@board[2]}"
end

def win?
  if @board[1] == @first_rod || @board[2] == @first_rod
    puts "Congratulations, you've won!"
    return true
  else 
    return false
  end
end

def move(rod1, rod2)
  rod2 << rod1.pop
end

def valid_move?(from, to)
  if @board[from].empty?
    return false
  elsif @board[to].empty?
    return true
  elsif @board[to][-1] > @board[from][-1]
    return true
  end
end


end












