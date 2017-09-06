require_relative "one_player.rb"
require_relative "two_player.rb"

p "Welcome to the game of rock, paper, scissors! Would you like to play against the computer or with a friend?"
sleep(1)
p "Press '1' to play against the computer."
sleep(1)
p "Press '2' to play with a friend."

choice = gets.chomp

if choice == "1"
  p "You've selected to play against the computer. Let's start!"
  game = OnePlayer.new()
  input = game.get_input
  computer = game.computer_move
  game.results(input, computer)
else
  p "You've selected to play with a friend. Let's start!"
  game = TwoPlayer.new()
  input = game.get_input
  friend = game.friend_input
  p "You chose #{input} and your friend chose #{friend}"
  sleep(1)
  game.results(input, friend)
end
