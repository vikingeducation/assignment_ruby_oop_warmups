class Towers
  attr_reader :game_state, :game_won, :player_input
  QUIT_OPTIONS = %w(quit exit q e).freeze

  def initialize(number_of_disks = 3)
    @game_state = game_init(number_of_disks)
    @game_won = false
    @player_input = {
      tar: 0,
      dest: 0
    }
  end

  def self.Start
    disks = 0

    until (3..7).cover? disks
      puts "How many disks (Please chose a number between 3 and 7):\n"
      print '> '
      disks = gets.chomp.to_i
    end

    t = Towers.new(disks)
    t.play
  end

  def play
    game_intro

    until game_won
      request_move
      player_entry = gets.chomp
      player_input[:tar], player_input[:dest] = validate_input(player_entry)

      validate_move
      check_game_state
    end

    puts 'You WON the game!'
  end

  private

  def game_init(num_of_disks)
    init_board = {
      rod_one: nil,
      rod_two: [],
      rod_three: []
    }
    init_board[:rod_one] = Array.new(num_of_disks) {|i| num_of_disks - i}

    init_board
  end

  def validate_input(input)
    exit_game?(input)

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
      player_input[:tar], player_input[:dest] = validate_input(gets.chomp)
    end
  end

  def request_move
    puts 'Enter move:'
    print '> '
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
    render_board
    request_move
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
        render_board
        return
      end
    end
    render_board
    invalid_move("no move")
  end

  def render_board
    print "\n"
    game_state.each do |row|
      row.each do |column|
        case column
        when (1..game_state.size)
          print 'o' * column + "\t\t"
        else
          print "\t\t"
        end
      end
      puts ''
    end
    puts "1\t\t2\t\t3"
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
  end
end

Towers.Start
