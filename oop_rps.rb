class Player

  attr_accessor :selection, :name

  def initialize(name=nil)
    @name = name
    @selection = nil
  end

end

class Human < Player

  def initialize(name)
    super
  end
end

class Computer < Player

  def initialize(name = "Computer")
    super
  end

  def select_random
    @selection  = ['Paper', 'Rock', 'Scissors'].sample
  end

end



def play

  puts "Thanks for playing Paper-Rock-Scissors"
  puts "Enter 1 if you would like to play against the computer or"
  puts "Enter 2 if you would like to play against another player"
  print ">> "
  input = gets.chomp.to_i
  while (input != 1) && (input!=2)
    puts "Invalid Input, enter 1 or 2"
    print ">> "
    input = gets.chomp
  end
  puts "Enter player 1's name:"
  print ">> "
  player_1_name = gets.chomp
  player_1 = Human.new(player_1_name)

  #create player 2
  if input == 1
    player_2 = Computer.new
  else
    puts "Enter player 2's name:"
    print ">> "
    player_2_name = gets.chomp
    player_2 = Human.new(player_2_name)
  end


  #loop thru game
  continue = true
  while continue
    puts "#{player_1.name} enter your selection: P for Paper, R for Rock, or S for Scissors"
    print ">> "
    input = gets.chomp
    while !valid_selection?(input)
      puts "Please enter a valid selection"
      print ">> "
      input = gets.chomp
    end
    player_1.selection = select(input)
    system "clear" #clear screen so other player cant see pick

    if player_2.class == Human
      puts "#{player_2.name} enter your selection: P for Paper, R for Rock, or S for Scissors"
      print ">> "
      input = gets.chomp
      while !valid_selection?(input)
        puts "Please enter a valid selection"
        print ">> "
        input = gets.chomp
      end
      player_2.selection = select(input)
    else
      player_2.select_random #if player 2 is computer
    end
    system "clear" #clear screen so other player cant see pick

    puts "#{player_1.name} picked: #{player_1.selection}"
    puts "#{player_2.name} picked: #{player_2.selection}"
    check_winner(player_1, player_2)

    puts "Would you like to play again? Enter Y for yes or any other key to exit"
    print ">> "
    input = gets.chomp
    if input.upcase != "Y"
      system "clear"
      exit
    end

  end
end

def valid_selection?(selection)
  #checks if input is valid
  selection = selection.upcase
  if selection == "P" || selection == "R" || selection == "S"
    return true
  else
    return false
  end
end


def select(char)
  #converts char to word
  char = char.upcase
  case char
  when "P" then "Paper"
  when "R" then "Rock"
  when "S" then "Scissors"
  end
end


def check_winner(p1,p2)
  #outputs the winner
  if p1.selection == p2.selection
    puts "You Tied"
  elsif (p1.selection == "Rock" && p2.selection == "Scissors") || (p1.selection == "Paper" && p2.selection == "Rock") || (p1.selection == "Scissors" && p2.selection == "Paper")
    puts "#{p1.name} Wins!"
  else
    puts "#{p2.name} Wins!"
  end
end

play
