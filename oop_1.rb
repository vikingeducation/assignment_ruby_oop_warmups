require 'pry'

class RPS
  attr_reader :players

  PLAY_OPTIONS = %w(1 2 3 R P S ROCK PAPER SCISSORS).freeze

  def initialize(options = {})
    @players = {

    }
    2.times do |num|
      @players["player_#{num+1}".to_sym] = options[:players][num]
    end
    puts @players
    @wins = []
    @two_player = options[:two_player]
    @game_state = {
      won: false,
      winner: ""
    }
  end

  def self.init
    puts 'Welcome to the Rock! Paper! SCISSOOOOOOOOOOOOOORS!'
    two_player_game
  end

  def self.two_player_game
    begin
      puts 'Will this be a 2 player game?'
      puts '1. One Player'
      puts '2. Two Players'
      print '> '
      one_or_two_of_players = gets.chomp.to_s
      raise StandardError if !['1', '2'].include?(one_or_two_of_players)
    rescue StandardError
      puts "Please enter '1' for a single player game or '2' for a two player game"
      retry
    end

    if one_or_two_of_players == '1'
      build_players(false)
    elsif one_or_two_of_players == '2'
      build_players(true)
    end
  end

  def self.build_players(is_two_players)
    unless is_two_players
      puts 'Please enter your name!'
      print '> '
      p1_name = gets.chomp
      one_player = {
        players: [Player.new(p1_name), Player.new],
        two_player_game: false
      }
      RPS.new(one_player).intro
    else
      puts 'Please enter player 1\'s name!'
      print '> '
      p1_name = gets.chomp
      puts 'Please enter player 2\'s name!'
      print '> '
      p2_name = gets.chomp
      two_player = {
        players: [Player.new(p1_name),Player.new(p2_name)],
        two_player_game: true
      }
      RPS.new(two_player).intro
    end
  end

  def intro
    puts `clear`
    puts "Welcome to the high ocatane world of RPS #{players[:player_1].name}!"
    puts "Let's get ready to RUUUUUUUMBLE!!"
    sleep(1)
    puts `clear`
    3.times do |i|
      puts "#{i + 1}!"
      sleep(0.5)
    end
    puts 'Go!!!'
    puts `clear`

    play
  end

  def play
    check_game
    if @game_state[:won] == true
      puts "Thanks for playing, #{players[:player_1].name}!"
    elsif @game_state[:won] == false
      puts `clear`
      begin
        puts 'Please select your play!'
        puts '1. [R]ock'
        puts '2. [P]aper'
        puts '3. [S]cissors'
        print '>  '
        choice = gets.chomp
        raise StandardError if !['1', '2', '3', 'R', 'P', 'S', 'ROCK', 'PAPER', 'SCISSORS'].include?(choice)
        clash(choice)
      rescue StandardError
        puts "Please read the input prompt and selection an option. For example\n"
        puts "For ROCK type in '1', 'R' OR 'Rock'"
        sleep(2)
        retry
      end
    end
  end

  def clash(choice)
    clash_choice = choice # if PLAY_OPTIONS.include?(choice)
    if %w(1 R ROCK).include?(clash_choice)
      puts 'You picked ROCK!'
      puts 'What does your opponent have up their sleave?'
      cpu_clash(clash_choice = 'ROCK')
    elsif %w(2 P PAPER).include?(clash_choice)
      puts 'You picked PAPER!'
      puts 'What does your opponent have up their sleave?'
      cpu_clash(clash_choice = 'PAPER')
    elsif %w(3 S SCISSORS).include?(clash_choice)
      puts 'You picked SCISSORS!'
      puts 'What does your opponent have up their sleave?'
      cpu_clash(clash_choice = 'SCISSORS')
    else
      puts "I'm sorry, there are only 3 choices in RPS!"
      puts 'You picked none of them! Try again!'
      play
    end

    sleep(1.5)
  end

  def cpu_clash(player_choice)
    cpu_choice = %w(ROCK PAPER SCISSORS).sample
    if cpu_choice == 'ROCK' && player_choice == 'PAPER'
      puts 'The computer\'s picked ROCK!'
      sleep(0.4)
      puts 'Your PAPER SMOTHERED THE ISH out of the computer\'s ROCK'
      puts "#{players[:player_1].name} win! Next round!"
      turn_acc(players[:player_1].name)
    elsif cpu_choice == 'ROCK' && player_choice == 'ROCK'
      puts 'The might of ROCK is an equal match for another ROCK'
      puts 'Next round!'
      turn_acc('DRAW')
    elsif cpu_choice == 'ROCK' && player_choice == 'SCISSORS'
      puts 'The computer\'s ROCK SMASHED DOWN ON your SCISSORS'
      puts 'CPU win! Next round!'
      turn_acc('CPU')
    elsif cpu_choice == 'PAPER' && player_choice == 'ROCK'
      puts 'The computer\'s PAPER SMOTHERED THE ISH out of your ROCK'
      puts 'CPU win! Next round!'
      turn_acc('CPU')
    elsif cpu_choice == 'PAPER' && player_choice == 'PAPER'
      puts 'The might of PAPER is an equal match for another PAPER'
      puts 'Next round!'
      turn_acc('DRAW')
    elsif cpu_choice == 'PAPER' && player_choice == 'SCISSORS'
      puts 'The computer\'s ROCK SMASHED DOWN ON your SCISSORS'
      puts "#{players[:player_1].name} win! Next round!"
      turn_acc(players[:player_1].name)
    elsif cpu_choice == 'SCISSORS' && player_choice == 'PAPER'
      puts 'The might ROCK is an equal match for another ROCK'
      puts 'CPU win! Next round!'
      turn_acc('CPU')
    elsif cpu_choice == 'SCISSORS' && player_choice == 'SCISSORS'
      puts 'The might of SCISSORS is an equal match for another SCISSORS'
      puts 'Next round!'
      turn_acc('DRAW')
    elsif cpu_choice == 'SCISSORS' && player_choice == 'ROCK'
      puts 'The computer\'s SCISSORS IS SMASHED DOWN BY your ROCK'
      puts "#{players[:player_1].name} win! Next round!"
      turn_acc(players[:player_1].name)
    end
  end

  def play_eval

  end

  def turn_acc(str)
    case str
    when players[:player_1].name, 'CPU'
      @wins << str
      play
    else
      play
    end
  end

  def check_game
    winner = Hash.new 0
    winner[players[:player_1].name] = 0
    winner[players[:player_2].name] = 0

    @wins.each do |player|
      winner[player] += 1
      end_game(winner) if winner[player] == 2
    end

    puts "The score is:"
    puts winner
    sleep (1)
  end

  def end_game(winner)
    # binding.pry
    @game_state[:won] = true
    puts "And the winner is....#{winner.max}!!!!"
  end
end

class Player
  attr_accessor :name
  attr_accessor :choice

  def initialize(player_name = nil, human_player = true)
    if player_name
      @name = player_name
    else
      @name = "CPU"
      human_player = false
    end

    @choice = ""
  end
end
