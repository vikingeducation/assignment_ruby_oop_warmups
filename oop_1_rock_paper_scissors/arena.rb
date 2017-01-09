# This contains the code to progress/play the game.

class Arena
  attr_accessor :rps_game, :player_1, :player_2, :rps_game_wins

  def initialize(rps_game)
    @rps_game = rps_game
    @rps_game_wins = rps_game.game_state[:wins]
    @player_1 = rps_game.players[:player_1]
    @player_2 = rps_game.players[:player_2]

    @rps_game_wins = {
      @player_1.name => 0,
      @player_2.name => 0
    }
  end

  def intro
    print `clear`
    puts 'Welcome to the high ocatane world of RPS!'
    puts "Let's get ready to RUUUUUUUMBLE!!"
    sleep(1)
    3.times do |i|
      puts "#{i + 1}!"
      sleep(0.5)
    end
    puts 'Go!!!'
    print `clear`

    play
  end

  def play
    begin
      run
    rescue SystemExit, Interrupt
    end

    puts "\nGoodbye!"
  end

  def run
    check_game
    if rps_game.game_state[:won] == true
      puts 'Thanks for playing!'
    elsif rps_game.game_state[:won] == false
      # make this into a choice method for the player
      rps_game.players.each_value do |player|
        player.choose_play
      end
      clash
    end
  end

  def clash
    puts "\n"
    puts "#{player_1.name} picked #{player_1.choice}!!!"
    puts "#{player_2.name} picked #{player_2.choice}!!!"

    if player_1.choice == player_2.choice
      puts "The might of #{player_1.choice} is an equal match for #{player_2.choice}\n"
      turn_acc('DRAW')
    else
      if player_2.choice == rps_game.win_tree[player_1.choice]
        puts "#{player_2.name}'s #{player_2.choice} defeats #{player_1.name}'s #{player_1.choice}\n"
        turn_acc(player_2.name)
      elsif player_1.choice == rps_game.win_tree[player_2.choice]
        puts "#{player_1.name}'s #{player_1.choice} defeats #{player_2.name}'s #{player_2.choice}\n"
        turn_acc(player_1.name)
      end
    end
  end

  #
  #

  def turn_acc(last_turn_winner)
    case last_turn_winner
    when player_1.name
      rps_game_wins[player_1.name] += 1
      run
    when player_2.name
      rps_game_wins[player_2.name] += 1
      run
    else
      run
    end
  end

  def check_game
    end_game(player_1.name) if rps_game_wins[player_1.name] == 2
    end_game(player_2.name) if rps_game_wins[player_2.name] == 2
    display_score(rps_game_wins) if rps_game.game_state[:won] == false
  end

  def end_game(winner)
    # binding.pry
    rps_game.game_state[:winner] = winner
    rps_game.game_state[:won] = true
    puts "*****\n"
    puts "And the winner is....#{rps_game.game_state[:winner]}!!!!"
    puts 'With a final score of: '
    display_score(rps_game_wins)
  end

  def display_score(wins)
    wins.each do |player, score|
      puts "#{player}: #{score}"
    end

    puts "\n"
  end
end
