# class Player:
#   methods: rock, paper, scissor
# class Computer:
#   methods: random_action
# class Game"
#   methods: gameover, win, lose

class Player
  attr_reader :input

  def action
    while true
      @input = gets.chomp.downcase
      if ['rock', 'paper', 'scissor', 'q'].include? @input
        break
      else
        puts "Please type in 'rock', 'paper' or 'scissor' to play"
        puts ""
      end
    end
    @input
  end
end

class Computer
  attr_reader :input

  def action
    @input = ['rock', 'paper', 'scissor'].sample
  end
end

class Game
  def initialize
    @player_1   = Player.new
    @computer_1 = Computer.new
  end

  def shown_welcome
    puts "Welcome to the Rock Paper Scissors game"
    puts "You can type q to quit at any time."
    puts "Type 'rock', 'scissor' or 'paper' to play"
    puts ""
  end

  def win? action_1, action_2
    return true if [action_1, action_2] == ['rock', 'scissor']
    return true if [action_1, action_2] == ['scissor', 'paper']
    return true if [action_1, action_2] == ['paper', 'rock']
  end

  def player_win?
    true if win? @player_1.input, @computer_1.input
  end

  def player_lose?
    true if win? @computer_1.input, @player_1.input
  end

  def game_even?
    true unless player_win? || player_lose?
  end

  def gameover
    true if @player_1.input == 'q'
  end

  def see_you
    puts ""
    puts "Byebye"
    puts "Hope you enjoyed this little game ^_^"
  end

  def show_result
    puts "Yeah, you win! computer is #{@computer_1.input}" if player_win?
    puts "T T, computer win ~ computer is #{@computer_1.input}" if player_lose?
    puts "Not bad, it is a even run. Fight again!" if game_even?
  end

  def fight_start
    @player_1.action
    @computer_1.action
  end

  def start
    shown_welcome
    until gameover
      fight_start
      show_result
    end
    see_you
  end
end
