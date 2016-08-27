class MainGame

  require "./rock"
  require "./paper"
  require "./scissors"
  require "./player"
  require "./human"

#----------

  def set_up_game

    puts "****************************************************************"
    puts "*                                                              *"
    puts "*                  THIS IS SPARTA!!!!!                         *"
    puts "*           I mean, this is Paper, Rock, Scissors              *"
    puts "*                                                              *"
    puts "*   This ain't your mommy's Paper, Rock, Scissors.  Around     *"
    puts "*   here, we fight to the death.  You and your opponent each   *"
    puts "*   have 50 points of health.  No health potions allowed.      *"
    puts "*   If you don't have the stomach for mortal combat, you may   *"
    puts "*   enter 'q' between rounds to surrender.                     *"
    puts "*                                                              *"
    puts "****************************************************************"
    puts "\n\n"

    @human_player = Human.new
    @player1 = @human_player.set_name
    
    @ai_choice = choose_computer_player
    @ai_character = Rock.new if @ai_choice == "rock"
    @ai_character = Paper.new if @ai_choice == "paper"
    @ai_character = Scissors.new if @ai_choice == "scissors"
    
    @player2 = @ai_character.name

    puts "\nWelcome #{@player1}!"
    puts "Today, you will be fighting #{@player2}."
  end

#----------

  def choose_computer_player

    r = rand(1..6)

    if r < 3
      return "rock"
    elsif r.between?(2, 4)
      return "paper"
    elsif r > 4
      return "scissors"
    end
    
  end

#----------

  def choose_player_weapon
    @player_weapon = " "

    until @player_weapon == "rock" || @player_weapon == "paper" || @player_weapon == "scissors"
      @player_weapon = @human_player.choose_weapon
    end

    puts "\n****************************************************************************"
    puts "\nYour weapon of choice is the #{@player_weapon}!"
    @player_weapon
  end

#----------

  def choose_ai_weapon
    @ai_weapon = @ai_character.choose_weapon(@player_weapon)
    puts "\n#{@player2} is determined to end your life with the #{@ai_weapon}!"
    @ai_weapon
  end

#----------

  def fight

    if @player_weapon == @ai_weapon
      puts "\nIt's a clash of the #{@player_weapon}s!  Both fighters draw blood!"
      puts "They each lose 5 points of health!"
      @human_player.take_damage(5)
      @ai_character.take_damage(5)

    elsif (@player_weapon == "rock" && @ai_weapon == "paper") || (@player_weapon == "paper" && @ai_weapon == "scissors") || (@player_weapon == "scissors" && @ai_weapon == "rock")
      puts "\n#{@player2} is a maniac with that #{@ai_weapon}!" if @ai_weapon == "rock" || @ai_weapon == "paper"
      puts "\n#{@player2} is a maniac with those #{@ai_weapon}!" if @ai_weapon == "scissors"
      puts "#{@player1} takes 10 points of damage!"
      @human_player.take_damage(10)

    elsif (@ai_weapon == "rock" && @player_weapon == "paper") || (@ai_weapon == "paper" && @player_weapon == "scissors") || (@ai_weapon == "scissors" && @player_weapon == "rock")
      puts "\n#{@player1} drops his #{@player_weapon} and wipes #{@player2}'s blood off his face."
      puts "#{@player2} takes 10 points of damage!"
      @ai_character.take_damage(10)
    end

  end

#----------

  def check_for_pulse #move to player class?

    player_dead = @human_player.dead?
    computer_dead = @ai_character.dead?

    if player_dead
      puts"\n***************************************************************************"
      puts "\nOh man!  What a bloodbath!"
      puts "\n#{@player2} promises to dance on your grave!\n\n"
      exit

    elsif computer_dead
      puts"\n***************************************************************************"
      puts "\nDon't slip in #{@player2}'s blood as you take your victory lap."
      puts "\nYou have vanquished #{@player2}!\n\n"
      exit
    end

  end

#----------

  def display_game_status(round)

    puts "\nAt the end of round #{round}, the combatants lick their wounds."
    puts "#{@player1}'s health is currently: #{@human_player.health}."
    puts "#{@player2}'s health is currently: #{@ai_character.health}."
    puts "Who has the greater will to live?  Only father time knows for sure.........."

  end

#----------

  def game_loop

    player_weapon = ""
    i = 1
    set_up_game
    choose_computer_player

    until i == 20

      choose_player_weapon
      choose_ai_weapon
      puts "\nRound #{i}!  Fight!!!!!!"
      fight
      check_for_pulse
      display_game_status(i)
      i += 1
    end

  end


end

play = MainGame.new
play.game_loop