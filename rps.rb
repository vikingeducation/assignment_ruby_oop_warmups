require 'pry-byebug'

class Game
  def initialize
    @player = Player.new
    @computer = Computer.new #@AI reference CLass Computer
    #prompt play to play
    prompt_player
    play
  end

  def does_p1_win?(player_input, computer_input)
    if player_input == "rock" && computer_input == "scissors"
      return true
    elsif player_input == "scissors" && computer_input == "paper"
      return true
    elsif player_input == "paper" && computer_input == "rock"
      return true
    elsif player_input == computer_input
      return false
    else
      false
    end
  end

  def tie? (player_input, computer_input)
    if player_input == computer_input
      return true
    else
      return false
    end
  end

  def prompt_player  #intro & rules
    puts "Rock, paper, scissors game!"
    print ">>"
  end

  def play
    binding.pry
    p_choice = @player.get_input
    c_choice = @computer.computer_choice
    puts "Computer picks #{c_choice}."
    if tie?(p_choice, c_choice)
      puts "It's a tie!"
    else
      if does_p1_win?(p_choice, c_choice)
        puts "Player wins!"
      else
        puts "Player loses!"
      end
    end
  end

end

class Player

  def initialize #??? do we need this?
  end

  def get_input #checks with get_input
    input = "rock" #gets.strip
    until valid_input? (input)
      input = gets.chomp
      return input
    end
  end

  def valid_input? (input)#if not, get_input again
    choices = ["rock", "paper", "scissors"]
    if choices.include? input
      true
    else
      false
    end
  end

end

class Computer

  def initialize

  end

  def computer_choice
    choices = ["rock", "paper", "scissors"]
    choices.sample
  end

end



