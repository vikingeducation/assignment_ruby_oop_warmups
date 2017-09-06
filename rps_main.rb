require './rps_ascii_art'
require './rps_game'

def welcome_player
  puts AsciiArt::TITLE
  puts "You go head to head against the computer's randomly-selected weapon."
  puts "The winner is the player who won the best out of 3 rounds."
end

def request_player_count
  puts "How many players? 1 or 2?"
  response = gets.chomp
end

def determine_type_of_game(player_count)
  if player_count == "1"
    return 'one_player'
  else player_count == "2"
    return 'two_player'
  end
end

def play_again?
  puts "Play again? Y | N"
  player_response = gets.chomp.upcase
  if player_response == "Y"
    return true
  elsif player_response == "N"
    exit_game
  else
    puts "I'm sorry, that's not an option."
    play_again?
  end
end

def exit_game
  puts "Okay Bye."
  exit
end


@play_game = true

while @play_game
  welcome_player
  game_type = determine_type_of_game(request_player_count)
  if game_type == 'one_player'
    game = OnePlayerGame.new
  else
    game = TwoPlayerGame.new
  end

  @play_game = play_again?
end
