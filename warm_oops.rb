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

#soo...making classes for Rock Paper and Scissors is definitely overkill but it was worthwhile to learn to extend the Comparable
  #and use all the cool <=> 's and

class Rock
  attr_reader :id
  include Comparable
  def initialize
    @id = "rock"
    @outcomes = { "paper"=> -1, "rock"=> 0, "scissors"=> 1}
  end
  def <=>(other)
    return @outcomes[ other.id ]
  end
end

class Paper
  attr_reader :id
  include Comparable
  def initialize
    @id = "paper"
    @outcomes = { "paper"=> 0, "rock"=> 1, "scissors"=> -1}
  end

  def <=>(other)
    return @outcomes[ other.id ]
  end
end

class Scissors
  attr_reader :id
  include Comparable
  def initialize
    @id = "scissors"
    @outcomes = { "paper"=> 1, "rock"=> -1, "scissors"=> 0}
  end
  def <=>(other)
    return @outcomes[ other.id ]
  end
end

#single player and 2 player
  #computer player class? human player class? -yea yea
class HumanPlayer
  @selection = nil
  @@options = ["rock", "paper", "scissors"]
  attr_reader :selection

  def initialize
    rock = Rock.new
    paper = Paper.new
    scissors = Scissors.new
    @option_objects = [rock, paper, scissors]
  end

  def choose
    puts "What'll it be? Rock, paper, or scissors?"
    #add some error checking here
    input = gets.chomp.downcase
    @selection = input if @@options.include?(input)
    @selection = @option_objects[@@options.index(@selection)]
  end

end

class ComputerPlayer
  @selection = nil
  #getters and setters for selection
  attr_reader :selection
  #@@options = ["rock", "paper", "scissors"]

  def initialize
    rock = Rock.new
    paper = Paper.new
    scissors = Scissors.new
    @options = [rock, paper, scissors]
  end

  #choose rock paper or scissors
  def choose
    #@selection = @@options[ rand(0..2) ]
    @selection = @options[ rand(0..2) ]
  end
end

#our game class
class RockPaperScissors

  def initialize
    @game_type = nil      #I'll use a string for a flag for now, ideally it'd be a #define macro  #what's the best flag method in Ruby? Hashes/Sets?
    welcome_mat
    play
  end

  def play
    single_player if @game_type == "hva"
    two_player if @game_type == "pvp"
  end


  def welcome_mat
    puts "WELCOME TO THE BATTLE OF THE CENTURY"
    puts "In this corner, we have our reigning Rock Paper Scissors WORLD CHAMPION, Macho Man Randy Savage!!"
    puts "Will you take on the champ (play versus AI) or would you prefer to play a Wealter-weight match (PvP)?"


    #check user input loop
    valid_input = false
    while !valid_input
      puts 'Please say "BRING IT ON" to face the champ or "I\'M TOO SCARED" to play versus another challenger.'
      input = gets.chomp.upcase
      if input == "BRING IT ON"
        #Human v AI
        valid_input = true
        @game_type = "hva"
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
    tied = true
    while tied
      player.choose
      ai.choose
      if ai.selection > player.selection
        #you lose
        puts "#{ai.selection.id} beats #{player.selection.id}"
        #randyQuote
        puts "MACHO MAN RANDY SAVAGE : Ohhhh yeeeeeeah"
        puts "You lose..."
        tied = false
      elsif ai.selection < player.selection
        #you win
        tied = false
        puts "#{player.selection.id} beats #{ai.selection.id}"
        puts "Congratualtions : you win !"
        puts "MACHO MAN RANDY SAVAGE : What can I say about this move? Nothing so I won’t."
        puts "You're now the WORLD CHAMPION! We're mailing your belt now."
      else
        #you tie play again
        puts "You both chose #{ai.selection.id}, try again."
        puts "MACHO MAN RANDY SAVAGE : Expect the unexpected in the kingdom of madness!"
      end
    end

  end

  def two_player
    player_1 = HumanPlayer.new
    player_2 = HumanPlayer.new

    tied = true
    while tied
      print "Player_1 : "
      player_1.choose
      print "Player_2 : "
      player_2.choose
      if player_2.selection > player_1.selection
        puts "#{player_2.selection.id} beats #{player_1.selection.id}"
        puts "Congratualtions Player 2 : you win !"
        tied = false
      elsif player_2.selection < player_1.selection
        puts "#{player_1.selection.id} beats #{player_2.selection.id}"
        puts "Congratualtions Player 1 : you win !"
        tied = false
      else
        #you tie play again
        print "Seems that you tied, "
        print "you both chose #{player_2.selection.id}"
        puts " try again."
      end
    end

  end


  def victory_screen
    puts "Congratualtions! You've won!"
  end

  #..
end
#add rounds....maybe
#test code 
#game = RockPaperScissors.new







##########  oop 2  #########
    ##########  zzzzzzzz   #########
