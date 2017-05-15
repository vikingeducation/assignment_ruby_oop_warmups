require 'pry'

class Player
  attr_reader :name, :choice
  RPS = %w[Rock Paper Scissors]

  def initialize(name, computer = true)
    @name = name
    @choice = nil
    @comp_user = nil

    create_computer if computer

    instructions unless @name == 'COMPUTER'
  end

  def create_computer
    # create an "ai", give it a choice as well
    @comp_user = Player.new('COMPUTER', false)
    @comp_user.choose(random:true)
  end

  def who_won(opponent = nil)
    if opponent
      puts winner(opponent)
    elsif @comp_user
      puts winner(@comp_user)
    else
      puts "You must give me the user you're playing against.\n\n"
    end
  end

  def winner(opponent)
    other = opponent.choice
    case choice
    when other
      'Draw'
    when 'Rock'
      other == 'Paper' ? opponent.name : name
    when 'Paper'
      other == 'Scissors' ? opponent.name : name
    when 'Scissors'
      other == 'Rock' ? opponent.name : name
    end
  end

  def choose(opts = { random: false })
    if opts[:random]
      rand_choose
    else
      user_choose
    end
  end

  def rand_choose
    @choice = RPS.sample
  end

  def user_choose
    valid = false
    until valid
      case input
      when '1', 'r', 'rock'
        @choice = RPS[0]
        break
      when '2', 'p', 'paper'
        @choice = RPS[1]
        break
      when '3', 's', 'scissors'
        @choice = RPS[2]
        break
      when 'quit'
        quit
      else
        invalid
      end
    end
  end

  def input
    print 'Enter choice > '
    begin
      gets.strip.downcase
    rescue SystemExit, Interrupt
      quit
    end
  end

  def invalid
    puts "Sorry, #{choice} is not valid.\n\n"
    instructions
  end

  def instructions
    puts 'Choose from the following:'
    puts "\tRock ('1'/'r'/'rock')"
    puts "\tPaper ('2'/'p'/'paper')"
    puts "\tScissors ('3'/'s'/'scissors').\n\n"
    puts 'Use #quit to quit.'
  end

  def quit
    puts "\n\nThanks for playing!\n\n"
    exit
  end

end
