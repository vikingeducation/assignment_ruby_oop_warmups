class HanoiTower
  attr_accessor :addresses

  def initialize disks
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
end