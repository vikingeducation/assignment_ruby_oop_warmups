require_relative 'tower_of_hanoi'

puts TowerOfHanoi.messages[:starting_message]
pieces = gets.chomp.to_i
min_steps = (2 ** pieces) - 1
game = TowerOfHanoi.new(pieces)
puts TowerOfHanoi.messages[:new_game]

until game.over?
  (pieces-1).downto(0) do |num|
    print "#{game.tower(1)[num]}\t|"
    print "#{game.tower(2)[num]}\t|"
    print "#{game.tower(3)[num]}\n"
  end

  puts TowerOfHanoi.messages[:prompt_user]
  input = gets.chomp
  if input.downcase == "q" || input.downcase == "quit"
    TowerOfHanoi.messages[:quit]
    break
  end

  directions = input.split("").collect(&:strip)

  game.move(directions[1].to_i, directions[3].to_i)
end

puts TowerOfHanoi.messages[:winner]
puts "You beat the game in #{game.counter} steps.\nIt takes a minimum of #{min_steps} steps to beat the game."
