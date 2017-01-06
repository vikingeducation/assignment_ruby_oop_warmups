require_relative 'towers'

class GameBoard
  QUIT_OPTIONS = %w(quit exit q e).freeze
  attr_accessor :game

  def initialize(game)
    @game = game
  end

  def self.StartTowersOfHanoi
    disks = 0

    until (3..7).cover? disks
      puts "How many disks (Please chose a number between 3 and 7):\n"
      print '> '
      disks = gets.chomp.to_i
    end

    t = Towers.new(disks)
    GameBoard.new(t).play
  end

  def play
    game_intro

    until game.game_won
      request_move
      player_entry = gets.chomp
      game.player_input[:tar], game.player_input[:dest] = game.validate_input(exit_game?(player_entry))

      if game.player_input[:tar] && game.player_input[:dest]
        game.validate_move
        game.check_game_state
        render_board
      end
    end

    puts 'You WON the game!'
  end

  def request_move
    puts 'Enter move:'
    print '> '
  end

  def game_intro
    puts 'Welcome to the To Towers of Hanoi!'
    puts 'Instructions:'
    puts "Enter where you'd like to move from and to"
    puts "in the format '1,3'. Enter 'q', 'quit', 'e' or 'exit' to quit.\n\n"
    render_board
  end

  def exit_game?(input)
    if QUIT_OPTIONS.include?(input.downcase)
      puts 'Thanks for playing!'
      exit
    end

    return input
  end

  def render_board
    print "\n"
    game.game_state.each do |row|
      row.each do |column|
        case column
        when (1..game.game_state.size)
          print 'o' * column + "\t\t"
        else
          print "\t\t"
        end
      end
      puts ''
    end
    puts "1\t\t2\t\t3"
  end
end
