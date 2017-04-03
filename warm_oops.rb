#Warm oops
#Eric Glover
#4/2/17

#TM T-Swift

##########  warm-up 1   #########

#reverse a string
def my_reverse( s )
  reversed_string = []

  #count down
  (s.length).downto(0) do |i|
    reversed_string << s[i]
  end

  return reversed_string
end

#print out the fibonacci sequence to the nth term (starting index = 1)
def fibonacci( n )
  current = 1
  previous = 1
  sequence = [1,1]

  #probably a cleaner way to handle these weird cases...but oh well
  if n == 1
    return 1
  elsif n == 2
    return sequence
  else
  end

  (n-2).times do |i|
    temp = current
    current = current + previous
    previous = temp
    sequence << current
  end
  return sequence
end

##########  warm-up 2   #########

def my_benchmark(number_of_times)
  #create current time
  start = Time.new
  number_of_times.times do
    yield
  end
  finish = Time.new
  elapsed_time = finish - start
end
#puts my_benchmark(10000) {puts "hi"}

##########  warm-up 3   #########
  ############ Rebuild Enumerables ############

#extends the array class, with new functionality that mimicks the Enumerable Module
class Array
  def my_each(proc_option = nil)
    i = 0
    while i < self.size
      if block_given?
        yield(self[i])
      else
        proc_option.call(self[i])
      end
      i += 1
    end
    self
  end

  def my_map(proc_option = nil)
    new_map = []
    i = 0
    while i < self.size
      if block_given?
        new_map << yield(self[i])
      else
        new_map << proc_option.call(self[i])
      end
      i += 1
    end
    new_map
  end

  def my_select(proc_option = nil)
    result = []
    i = 0
    while i < self.size
      if block_given?
        result << self[i] if yield(self[i])
      else
        result << self[i] if proc_option.call(self[i])
      end
      i += 1
    end
    result
  end

  def my_all(proc_option = nil)
    i = 0
    while i < self.size
      if block_given?
        return false unless yield(self[i])
      else
        return false unless proc_option.call(self[i])
      end
      i += 1
    end
    return true
  end

  def test(&proc)
    puts "SUCCESS"
  end

  #def my_inject(start_value, &proc_option)       ###problems
  def my_inject(start_value, proc_option = nil)       ###problems
    i = 0
    last_iteration = start_value
    while i < self.size
      #last_iteration = yield(last_iteration, self[i]) if block_given?
      #last_iteration = proc_option.call(last_iteration, self[i]) unless block_given?     #I actually think the if's look cleaner here

      if block_given?
        last_iteration = yield(last_iteration, self[i])
      else
        last_iteration = proc_option.call(last_iteration, self[i])
      end

      i += 1
    end
    return last_iteration
  end

end
#test code, for inject
#p = Proc.new { |total, i| total + i}
#puts [1,2,3,4,5].my_inject(0, p)
#puts [1,2,3,4,5].my_inject(0) {|total, i| total + i}

##########  oop 1  #########
    ##########  Rock, Paper, Scissors   #########

#single player and 2 player
#classes? could do a class for Rock Paper & Scissors, but that seems like over-kill
  #computer player class? human player class?
class HumanPlayer
  @selection = nil
  @@options = ["rock", "paper", "scissors"]
  attr_reader :selection

  def choose
    puts "What'll it be? Rock, paper, or scissor?"
    input = gets.chomp.downcase
    @selection = input if @@options.include?(input)
  end

end

class ComputerPlayer
  @selection = nil
  #getters and setters for selection
  attr_reader :selection
  @@options = ["rock", "paper", "scissors"]

  #choose rock paper or scissors
  def choose
    @selection = @@options[ rand(0..2) ]
  end
end

class Rock
  @outcomes = { "paper"=> -1, "rock"=> 0, "scissors"=> 1}
  @id = "rock"
  attr_reader :id
  def <=>(other)
    return @outcomes[ other.id ]
  end
end

class Paper
  @outcomes = { "paper"=> -1, "rock"=> 0, "scissors"=> 1}
  @id = "paper"
  attr_reader :id
  def <=>(other)
    return @outcomes[ other.id ]
  end
end

class Scissors
  @outcomes = { "paper"=> -1, "rock"=> 0, "scissors"=> 1}
  @id = "scissors"
  attr_reader :id
  def <=>(other)
    return @outcomes[ other.id ]
  end
end

#our game class
class RockPaperScissors
  @game_type = nil      #I'll use a string for a flag for now, ideally it'd be a #define macro  #what's the best flag method in Ruby? Hashes/Sets?
  def welcome_mat
    puts "WELCOME TO THE BATTLE OF THE CENTURY"
    puts "In this corner, we have our reigning Rock Paper Scissors WORLD CHAMPION, Mucho Man Randy Savage!!"
    puts "Will you take on the champ (play versus AI) or would you prefer to play a Wealter-weight match (PvP)?"


    #check user input loop
    input = gets.chomp.upcase
    valid_input = false
    while !valid_input
      puts 'Please say "BRING IT ON" to face the champ or "I\'M TOO SCARED" to play versus another challenger.'
      if input == "BRING IT ON"
        #Human v AI
        valid_input = true
        @game_type = "hvh"
      elsif input == "I'M TOO SCARED"
        #Human v Human
        valid_input = true
        @game_type = "pvp"
      else
        #error message
        puts "I'm sorry I couldn't hear you over all your whimpering."
      end
    end
  end

  def single_player
    ai = ComputerPlayer.new
    player = HumanPlayer.new

  end

  #tell us who wins, could perhaps make a rock paper and scissors class and then extend the <=> operator for them
  def who_wins (player_1, player_2)


  end


  def two_player
    #..
  end


  def victory_screen
    puts "Congratualtions! You've won!"
  end

  #..
end
#add decide single, two_player, or computer
#add rounds....maybe
#add victory screen






##########  oop 2  #########
    ##########  zzzzzzzz   #########
