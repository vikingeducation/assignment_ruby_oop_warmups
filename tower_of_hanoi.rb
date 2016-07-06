class TowerOfHanoi
  def initialize(number_of_disks)
    @num_disks = number_of_disks
    @Tower1 = Tower.create_full_tower(number_of_disks)
    @Tower2 = Tower.create_empty_tower(number_of_disks)
    @Tower3 = Tower.create_empty_tower(number_of_disks)
    @towers = [@Tower1, @Tower2, @Tower3]
    render
  end
   
  def play
    while game_over == false
      puts "...game is ongoing.."
      user_input_start_end = user_moves
      make_move(user_input_start_end[0], user_input_start_end[1])
      render
    end
  end

  def user_moves
    gets.gsub(/\D/, '')
  end

  def make_move(user_start, user_end)
    prom_index = @towers[user_start.to_i-1].find_prominent_disk_index
    puts "this is the index of start's prominent disk: #{prom_index}"
    start_disk = @towers[user_start.to_i-1].levels[prom_index]

    if @towers[user_end.to_i-1].can_stack?(start_disk)
      index = @towers[user_end.to_i-1].find_prominent_disk_index
      @towers[user_end.to_i-1].push(index - 1, start_disk)
      @towers[user_start.to_i-1].levels[prom_index] = Disk.create_empty_disk(@num_disks)
    else
      print "You can't do that, try again. \n"
    end
  end

  def game_over
    @Tower3.levels.each {|disk| return false if disk.hashes == 0}
    return true
  end

  def render
    @num_disks.times do |num_level|
      3.times {|tower| print @towers[tower].levels[num_level].render}
      puts " "
    end
  end
end

class Tower
  attr_accessor :levels

  def initialize(number_of_disks)
    @levels = Array.new(number_of_disks)
  end

  def self.create_full_tower(number_of_disks)
    temp_tower = Tower.new(number_of_disks)
    number_of_disks.times {|size| temp_tower.levels[size] = Disk.new(size + 1, number_of_disks)}
    temp_tower
  end

  def self.create_empty_tower(number_of_disks)
    temp_tower = Tower.new(number_of_disks)
    number_of_disks.times do |size|
      temp_tower.levels[size] = Disk.create_empty_disk(number_of_disks)
    end
    temp_tower
  end

  def push(index, a_disk)
    index = @levels.length - 1 if @levels[-1].hashes == 0
    puts "this is the index of end's prominent disk: #{index}"
    @levels[index] = a_disk
  end

  def find_prominent_disk_index
    @levels.each_with_index do |disk, index| 
      if disk.hashes == 0
        return @levels.length - 1 if index == @levels.length - 1
        next
      elsif disk.hashes > 0
        return index == 0 ? 0 : index
      end
    end
  end

  def can_stack?(a_disk)
    return true if @levels[find_prominent_disk_index].hashes == 0
    a_disk.is_bigger?(@levels[find_prominent_disk_index]) ? false : true
  end

  def render
    @levels.each {|disk| disk.render}       
  end
end

class Disk
  attr_reader :hashes

  def initialize(size, number_of_disks) 
    @hashes = size.to_i
    @spaces = number_of_disks - size
    @num_disks = number_of_disks
  end 

  def self.create_empty_disk(number_of_disks)
    Disk.new(0, number_of_disks)
  end

  def render
    @hashes == 0 ? "_" * @num_disks + " " : ("#" * @hashes) + ("_" * @spaces) + " "
  end

  def is_bigger?(other_disk)
    self.hashes > other_disk.hashes ? true : false
  end
end

toh = TowerOfHanoi.new(3)
toh.play
