require_relative 'player'
require_relative 'render'

class Game
  MOVE_OPTIONS = {"r" => "p",
                  "p" => "s",
                  "s" => "r"
  }

  def initialize
    @render = Render.new
    @render.welcome
    assign_players
    game_loop
  end

  def assign_players
    @player_one = HumanPlayer.new('human', "Player one")
    player_one = @player_one
    if player_two_select(gets.chomp) == 'h'
      @player_two = HumanPlayer.new('human', "Player two")
      player_two = @player_two
    else
      @player_two = ComputerPlayer.new('computer')
      player_two = @player_two
    end
  end

  def player_two_select(input)
    valid_input(input, %w(h c))
  end

  def game_loop
    player_one_move
    player_two_fork
    show_winner
    add_points
    @render.score_update([@player_one.name, @player_one.points],
                         [@player_two.name, @player_two.points])
    @render.play_again_message
    play_again(gets.chomp)
  end

  def player_one_move
    @render.move_prompt(@player_one.name)
    @player_one.get_move
    valid_input(@player_one.move, %w(r p s))
    @render.valid_confirmation
  end

  def player_two_fork
    @player_two.type == 'human' ? human_two_move : computer_move
  end

  def human_two_move
    @render.move_prompt(@player_two.name)
    @player_two.get_move
    valid_input(@player_two.move, %w(r p s))
    @render.valid_confirmation
  end

  def computer_move
    @player_two.get_move
  end

  def determine_winner
    if MOVE_OPTIONS[@player_one.move] == @player_two.move
      @player_two
    elsif MOVE_OPTIONS[@player_two.move] == @player_one.move
      @player_one
    end
  end

  def show_winner
    if determine_winner == @player_one
      @render.winner(@player_one)
    elsif determine_winner == @player_two
      @render.winner(@player_two)
    else
      @render.tie
    end
  end

  def add_points
    if determine_winner == @player_one
      @player_one.points += 1
    elsif determine_winner == @player_two
      @player_two.points += 1
    end
  end

  def valid_input(input, acceptable_values)
    if input == 'q'
      exit
    elsif acceptable_values.include? input
      input
    else
      @render.unacceptable_input
      valid_input(gets.chomp, acceptable_values)
    end
  end

  def play_again(input)
    valid_input(input, %w(y n)) == 'y' ? game_loop : exit
  end

end
