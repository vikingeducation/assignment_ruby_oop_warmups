VALID_CHOICES = {"R" => "Rock", "P" => "Paper", "S" => "Scissors"}

class Player

  attr_accessor :name, :choice, :won, :times_won
  attr_writer :chooses, :won_tally_plus

  def initialize(name)
    @name = name
    @choice = nil
    @won = false
    @times_won = 0
  end

  def chooses(input)
    @choice = input
  end

  def won
    @won = "true"
  end

  def won_tally_plus(num)
    @times_won += num
  end

end


class Game

  def initialize(player_one, player_two)
    @player_one = player_one
    @player_two = player_two
    @player_input = {}
    @both_choices = nil
    @winner = nil
    @loser = nil
    @num_ties = 0
    @round_num = -1
  end

  def play
    puts "When prompted, enter [R], [P], or [S] to indicate your move. The game will continue until you quit, which you can do at any time by pressing [Q]."
    loop do
      catch :tie do
        @round_num += 1
        get_moves
        restate_input
        determine_winner
        output_result
        puts "Next round!"
      end
    end
  end

  def get_moves
    prompt_move(@player_one)
    if @player_two.name == "the computer"
      @player_two.chooses(VALID_CHOICES.keys.sample)
    else
      prompt_move(@player_two)
    end
  end

  def prompt_move(player)
    puts "Ready, #{player.name}?? Enter your move below."
    puts "...[R]ock (@)" 
    puts "...[P]aper []" 
    puts "...[S]cissors 8<"
    puts "...GO!"
    print "> "
    input = gets.strip.upcase[0]
    process_input(input, player)
  end

  def process_input(input, player)
    if quit?(input) 
      quit
    elsif input_invalid?(input)
      puts "Input not valid, please try again."
      print "> "
      input = gets.strip.upcase[0]
      process_input(input, player)
    else
      player.chooses(input)
    end
  end

  def restate_input
    puts "#{@player_one.name} chose #{VALID_CHOICES[@player_one.choice]}; #{@player_two.name} chose #{VALID_CHOICES[@player_two.choice]}."
  end

  def determine_winner
    @player_input = { @player_one => @player_one.choice, @player_two => @player_two.choice }
    if @player_input.values.uniq.length == 1
      tie
    else
      @both_choices = @player_input.values.sort
      @both_choices = ["S", "P"] if @both_choices == ["P", "S"]
      @winner = @player_input.key(@both_choices[0])
      @loser = @player_input.key(@both_choices[1])
    end
  end

  def output_result
    print "#{VALID_CHOICES[@winner.choice]} beats #{VALID_CHOICES[@loser.choice]}! "
    puts "#{@winner.name} wins this round.".capitalize
    track(@winner)
  end

  def track(winner)
    winner.won
    winner.won_tally_plus(1)
  end

  def input_invalid?(input)
    !VALID_CHOICES.key?(input)
  end

  def tie
    puts "It's a tie! Let's try this again."
    @num_ties += 1
    throw :tie
  end

  def quit?(input = nil)
    input == "Q"
  end

  def quit
    puts "Quitting now. Come play again soon!"
    puts "Final game stats:"
    puts "Out of #{@round_num} rounds played,"
    puts "#{@player_one.name} won #{@player_one.times_won} rounds;"
    puts "#{@player_two.name} won #{@player_two.times_won} rounds;"
    puts "and there were #{@num_ties} ties."
    exit
  end

end


def welcome
  print "\n"
  puts "(@) [] 8< (@) [] 8< (@) [] 8< (@) [] 8< (@) [] 8<"
  puts "[] 8< (@) [] 8< (@) [] 8< (@) [] 8< (@) [] 8< (@)"
  puts "8< (@) [] 8< (@) [] 8< (@) [] 8< (@) [] 8< (@) []"
  puts "(@)                                            8<"
  puts "[]          Welcome to a new game of          (@)"
  puts "8<           ROCK, PAPER, SCISSORS!            []"
  puts "(@)                                            8<"
  puts "[] 8< (@) [] 8< (@) [] 8< (@) [] 8< (@) [] 8< (@)"
  puts "8< (@) [] 8< (@) [] 8< (@) [] 8< (@) [] 8< (@) []"
  puts "(@) [] 8< (@) [] 8< (@) [] 8< (@) [] 8< (@) [] 8<"
  print "\n"
end

def new_game
  welcome
  puts "Do you want to play with [1] or [2] players?"
  print "> "
  num_players = gets.strip.to_i
  until num_players == 1 || num_players == 2
    puts "Please indicate whether you want to play with [1] or [2] players."
    print "> "
    num_players = gets.strip.to_i
  end
  puts "Excellent choice. Now, Player One, what is your name?"
  print "> "
  player_one = Player.new(gets.chomp)
  if num_players == 2
    puts "And Player Two, your name please?"
    print "> "
    player_two = Player.new(gets.chomp)
  else
    player_two = Player.new("the computer")
  end
  puts "Initializing game between #{player_one.name} and #{player_two.name}..."
  game = Game.new(player_one, player_two)
  game.play
end

new_game