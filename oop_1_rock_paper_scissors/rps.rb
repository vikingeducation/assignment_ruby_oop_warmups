# if you wish to play the game in IRB/PRY load this file
# This contains the code for the game state

require_relative 'arena'
require_relative 'player'

class RPS
  attr_reader :players, :wins, :game_state, :win_tree

  def initialize(options = {})
    @players = {
    }
    2.times do |num|
      @players["player_#{num + 1}".to_sym] = options[:players][num]
    end
    @game_state = {
      won: false,
      wins: {},
      winner: ''
    }

    @win_tree = {
      'SCISSORS' => 'ROCK',
      'ROCK' => 'PAPER',
      'PAPER' => 'SCISSORS'
    }
  end

  def self.init
    print `clear`
    puts "Welcome to the Rock! Paper! SCISSOOOOOOOOOOOOOORS!\n"
    num_of_players
  end

  def self.start(rps_game)
    Arena.new(rps_game).intro
  end

  def self.num_of_players
    begin
      print `clear`
      puts 'Will this be a [One] or [Two] player game?'
      puts '1. One Player'
      puts '2. Two Players'
      print '> '
      one_or_two_of_players = gets.chomp.to_s
      entry_check = %w(1 2).include?(one_or_two_of_players)
      puts "Please enter '1' for a single player game or '2' for a two player game" unless entry_check
    end until %w(1 2).include?(one_or_two_of_players)

    if one_or_two_of_players == '1'
      build_players(false)
    elsif one_or_two_of_players == '2'
      build_players(true)
    end
  end

  def self.build_players(is_two_players)
    if is_two_players
      puts 'Please enter player 1\'s name!'
      print '> '
      p1_name = gets.chomp
      puts 'Please enter player 2\'s name!'
      print '> '
      p2_name = gets.chomp
      two_player = {
        players: [HumanPlayer.new(p1_name), HumanPlayer.new(p2_name)],
      }
      self.start(RPS.new(two_player))
    else
      puts 'Please enter your name!'
      print '> '
      p1_name = gets.chomp
      one_player = {
        players: [HumanPlayer.new(p1_name), CPUPlayer.new],
      }
      self.start(RPS.new(one_player))
    end
  end
end
