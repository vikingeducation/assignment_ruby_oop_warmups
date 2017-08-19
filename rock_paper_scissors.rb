class Player
  attr_reader :won, :rsp
  def initialize
    @rsp = {:s => 'scissors', :p => 'paper', :r =>'rock'}
    @won = 0
  end
  def increment_won
    @won += 1
  end
  def valid?(input, ary_expression)
    ary_expression.include?(input)
  end
  def play(vs_player)
    return 'tie' if self.choice == vs_player.choice
    return 'win' if (self.choice == :r && vs_player.choice == :s) || (self.choice == :s && vs_player.choice == :p) || (self.choice == :p && vs_player.choice == :r)
    return 'lose'
  end
end

class HumanPlayer<Player
  attr_reader :choice, :name
  @@player = 0
  def initialize
    super()
    @@player +=1
    print "Player#{@@player}, enter your name: "
    @name = gets.chomp
  end
  def instructions
    puts "Enter your choice: 'r' for Rock"
    puts "                   'p' for Paper"
    puts "                   's' for Scissors"
  end
  def get_choice
    begin
      print "#{@name}, your choice > "
    end until valid?(@choice = gets.chomp.to_sym, [:r, :s, :p])
    @choice
  end
end

class IAPlayer<Player
  attr_reader :choice, :name
  def initialize
    super()
    @name = "Computer"
  end
  def get_choice
    @choice = rsp.keys.sample
  end
end

def game(player1, player2)
    player1.instructions
    input1 = player1.get_choice
    input2 = player2.get_choice
    puts "#{player1.name} " + player1.rsp[input1]
    puts "#{player2.name} " + player2.rsp[input2]
    player1.play(player2)
end

def get_mode
 until mode = gets.chomp.to_i.between?(1,2)
  print "> "
 end
 mode.to_s
end

puts "Enter your choice '1' : Player vs Computer "
puts "                  '2' : Player vs Player"
print "> "
mode = get_mode
if mode == '1'
  player1 = HumanPlayer.new
  player2 = IAPlayer.new
else
  player1 = HumanPlayer.new
  player2 = HumanPlayer.new
end

while mode != 'q'
  challenge = game(player1, player2)

  if challenge == 'win'
     puts "#{player1.name} win, #{player1.increment_won} challenge won"
     puts "#{player2.name} lose, #{player2.won} challenge won"
  elsif challenge == 'lose'
    puts "#{player1.name} lose, #{player1.won} challenge won"
    puts "#{player2.name}  win, #{player2.increment_won} challenge won"
  else
    puts "Tie"
  end
  print "Exit challenge?, press 'q': "
  mode = gets.chomp
end
