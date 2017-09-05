require_relative "player.rb"
require_relative "computer.rb"

p "Game start!"

steven = Player.new

steven_move = steven.get_move

machine = Computer.new

machine_move = machine.get_move

if machine_move ==
  puts "computer wins!"
elsif machine_move < steven_move
  puts "you win!"
else
  puts "tie!"
end
