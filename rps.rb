require pry

class Player
  rps = %w[Rock Paper Scissors]

  def initialize(name, auto_create = true)
    create_auto if auto_create

    @name = name
    @user_choice = nil
  end

  def create_auto
    # create an "ai", give it a choice as well
    @auto_user = Player.new('AUTO', false)
    @auto_user.choose('auto')
  end

  def choose(choice = nil)
    if choice == 'auto'
      ai_choose
    else
      user_choose(choice)
    end
  end

  def ai_choose
    @user_choice = rps.sample
  end

  def user_choose(choice)
    case choice
    when '1', 'r', 'rock'
      @user_choice = rock
    when '2', 'p', 'paper'
      @user_choice = paper
    when '3', 's', 'scissors'
      @user_choice = scissors
    else
      invalid
    end
  end

  def invalid
    puts "Sorry, #{choice} is not valid."
    instructions
  end

  def instructions
    puts 'Choose from the following:'
    puts "\tRock ('1'/'r'/'rock')"
    puts "\tPaper ('2'/'p'/'paper')"
    puts "\tScissors ('3'/'s'/'scissors')."
    puts 'Use #quit to quit.'
  end

end
