# This contains the code for the players and player actions.

class Player
  attr_accessor :name
  attr_accessor :choice

  def initialize(player_name = nil)
    @name = if player_name
              player_name
            else
              'CPU'
            end

    @choice = ''
  end
end

class HumanPlayer < Player
  PLAY_OPTIONS = %w(1 2 3 R P S ROCK PAPER SCISSORS).freeze

  def choose_play
    begin
      puts 'Please select your play!'
      puts '1. Rock'
      puts '2. Paper'
      puts '3. Scissors'
      print '>  '
      choice = gets.chomp
    end until PLAY_OPTIONS.include?(choice)

    case choice
    when '1', 'R', 'ROCK'
      choice = 'ROCK'
    when '2', 'P', 'PAPER'
      choice = 'PAPER'
    when '3', 'S', 'SCISSORS'
      choice = 'SCISSORS'
    end

    self.choice = choice
    nil
  end
end

class CPUPlayer < Player
  CPU_PLAY_OPTIONS = %w(ROCK PAPER SCISSORS).freeze

  def choose_play
    self.choice = CPU_PLAY_OPTIONS.sample
    nil
  end
end
