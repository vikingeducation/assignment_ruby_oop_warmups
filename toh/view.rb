class View
  DISCS = 3

  attr_reader :welcome

  def welcome
    puts 'Welcome to Tower of Hanoi!'
    puts 'Instructions:'
    puts 'Enter where you\'d like to move from and to in the format \'1,3\'. Enter \'q\' to quit.'
  end

  def render(towers)
    towers = towers.tower
    space = DISCS + 2
    (0..DISCS).reverse_each do |row|
      (0...DISCS).each do |tower|
        print towers[tower][row].nil? ? ' '.ljust(space) : ("o" * towers[tower][row]).ljust(space)
      end
      puts
    end
    (1..DISCS).each { |n| print n.to_s.ljust(space)}
    puts
  end

  def prompt_move
    puts "\nEnter move >"
  end

  def game_won
    puts "Congratulations! 🎉   🍾"
    puts "You've won!"
    puts "Goodbye."
  end


end
