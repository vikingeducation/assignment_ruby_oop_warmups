class TowerOfHanoi(number_of_disks)

  def initialize
    @Tower1 = Tower.create_full_tower(number_of_disks)
    @Tower2 = Tower.create_empty_tower(number_of_disks)
    @Tower3 = Tower.create_empty_tower(number_of_disks)
    @towers = [@Tower1, @Tower2, @Tower3]

  #Initial Insructions
   


  #Display Board
  #Ask for move
  user_input = gets.chomp.split('')

  #Validate Move
  #Make Move
  #Check for Victory

end



class Tower

  attr_accessor :levels

  def initialize(number_of_disks)
    @levels = Array.new(number_of_disks)

  end



  def self.create_full_tower(number_of_disks)
    temp_tower = Tower.new(number_of_disks)
    number_of_disks.times do |size|
      temp_tower.levels[size] = Disk.new(size + 1, number_of_disks)
    end
    temp_tower


  end

  def self.create_empty_tower(number_of_disks)
    temp_tower = Tower.new(number_of_disks)
    number_of_disks.times do |size|
      temp_tower.levels[size] = Disk.new(0, number_of_disks)
    end
    temp_tower
  end

  def render
    @levels.each {|disk| puts disk.render}       
  end

end


class Disk

  attr_reader :hashes

  def initialize(size, number_of_disks) 
    @hashes = size.to_i
    @spaces = number_of_disks - size
  end 

  

  def render
    ("#" * @hashes) + ("_" * @spaces) + " "
  end

  def is_bigger?(other_disk)
    if self.hashes > other_disk.hashes
      true
    else
      false
    end
  end


end

temp_tower1 = Tower.create_full_tower(3)
temp_tower2 = Tower.create_empty_tower(3)
temp_tower3 = Tower.create_empty_tower(3)
print temp_tower1.levels[0].render
print temp_tower2.levels[0].render
print temp_tower3.levels[0].render
# puts temp_tower.levels[0].hashes



