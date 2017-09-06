require_relative "tower_game.rb"

p "Welcome to the tower of hanoi!"
p "Select the difficulty level - enter a number from 1 to 10"

level = gets.chomp

game = TowerGame.new(level)

while true
  input = game.prompt_move
  game.stack_move(input)
  game.check
  break if game.check
end
