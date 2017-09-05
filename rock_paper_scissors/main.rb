p "Welcome to the game of rock, paper, scissors! Would you like to play against the computer or with a friend?"
p "Press '1' to play against the computer."
p "Press '2' to play with a friend."

choice = gets.chomp

if choice = "1"
  p "You've selected to play against the computer. Let's start!"
  game = OnePlayer.new()
else
  p "You've selected to play with a friend. Let's start!"
  game = TwoPlayer.new()
end
