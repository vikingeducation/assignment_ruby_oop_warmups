require_relative 'player'
require_relative 'game'

class Render

  def welcome
    puts "Welcome to Rock Paper Scissors!"
    puts "(Note that you may enter 'q' at any time to exit the game.)"
    puts "Before we get started would you like to play against another human (enter 'h'),"
    puts "or would you like to play against the computer (enter 'c')?"
  end

  def unacceptable_input
    puts "I'm sorry, please review the possible inputs above and try again!"
  end

  def move_prompt(name)
    puts "#{name}, please select 'r' for rock, 'p' for paper, or 's' for scissors!"
  end

  def valid_confirmation
    puts "Nice move!"
    puts "\n"
  end

  def winner(player)
    puts "Congratulations #{player.name}! You have won this round!"
    puts "\n"
  end

  def tie
    puts "I'm sorry, you tied!"
    puts "\n"
  end

  def score_update(player_one, player_two)
    puts "The points right now are:"
    puts "#{player_one[0]}:"
    puts "#{player_one[1]}"
    puts "#{player_two[0]}"
    puts "#{player_two[1]}"
    puts "\n"
  end

  def play_again_message
    puts "Would you like to play another round? Enter 'y' for yes or  'n' for no."
  end




end
