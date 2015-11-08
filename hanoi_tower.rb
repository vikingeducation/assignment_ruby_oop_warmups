# Maintains game "board" state
class HanoiTower
  attr_accessor :addresses

  def initialize disks = 3
    @disks = disks
    # initializing an address hash for each disk.
    @addresses = {1 => nil, 2 => [], 3 => []}
    @addresses[1] = Array.new(@disks) { |i| @disks - i }
  end

  def render
    # Towers and disks
    @disks.times do |reverse_level|
      level_index = @disks - reverse_level - 1
      level_string = ''

      3.times do |tower_minus_one|
        tower = tower_minus_one + 1
        if @addresses[tower][level_index].nil?
          level_string += ' ' * (@disks + 2)
        else
          level_string += ' ' + ' ' * (@disks - @addresses[tower][level_index]) + 'o' * @addresses[tower][level_index] + ' '
        end
      end

      puts level_string
    end

    # Tower labels
    puts "-" * (@disks + 2) * 3
    labels = ''
    3.times { |i| labels += "#{' ' * (@disks - 1)}#{i + 1}#{' ' * (@disks - 1)}"}
    puts labels
  end

  def place_disk move
    if disk_move_valid?(move)
      @addresses[move.last] << @addresses[move.first].pop
      true
    else
      false
    end
      # if user_won?
      #   puts "YOU WON!!"
      #   quit
  end

  def disk_move_valid? move
    if @addresses[move.first].empty?
        puts "No disk present! Try again..."
    elsif @addresses[move.last].empty?
      true
    elsif @addresses[move.last].last > @addresses[move.first].last
      true
    else
      puts "Invalid move.  You are trying to put a larger disk on top of a smaller one.  Try again..."
    end
  end

  def winning_board?
    @addresses[3] == Array.new(@disks) { |i| @disks - i }
  end
end