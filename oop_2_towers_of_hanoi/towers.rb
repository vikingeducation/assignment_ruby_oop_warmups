class Towers
  attr_reader :game_state, :game_won, :player_input

  def initialize(number_of_disks = 3)
    @game_state = game_init(number_of_disks)
    @game_won = false
    @player_input = {
      tar: nil,
      dest: nil
    }
  end

  def game_init(number_of_disks)
    initial_state = []
    1.upto(number_of_disks) do |time|
      initial_state.push([time, 0, 0])
    end
    initial_state
  end

  def validate_input(input)
    checked_input = []
    if input.split('').include?(',')
      input.split('').select do |elem|
        checked_input << elem.to_i if (1..3).cover?(elem.to_i)
      end
    end
    if checked_input.size == 2
      return checked_input
    else
      invalid_move
      return false, false
    end
  end


  def invalid_move(error_kind="incorrect")
    case error_kind
    when "no move"
      puts '****** It looks like there is no move ******'
      puts '****** to make based on your entries ******'
      puts '****** pick another move ******'
    when "incorrect"
      puts '****** Please enter 2 numbers ******'
      puts '****** Separated by a comma ******'
      puts '****** To make a valid move ******'
      puts '****** e.g. 1,2 OR 3,2 ******'
    end
  end

  def check_game_state
    if game_won == false
      1.upto(game_state.size) do |time|
        return if game_state[time - 1][2] != time
      end
      @game_won = true
    end
  end

  def validate_move
    game_state.each_index do |ind|
      next unless game_state[ind][player_input[:tar] - 1] != 0
      game_state.size.downto(0) do |back_track|
        if back_track != game_state.size && game_state[back_track - 1][player_input[:dest] - 1] == 0
          next unless game_state[back_track][player_input[:dest] - 1] > game_state[ind][player_input[:tar] - 1]
        end

        next unless game_state[back_track - 1][player_input[:dest] - 1] == 0
        game_state[back_track - 1][player_input[:dest] - 1] = game_state[ind][player_input[:tar] - 1]
        game_state[ind][player_input[:tar] - 1] = 0
        return
      end
    end
    invalid_move("no move")
  end

end
