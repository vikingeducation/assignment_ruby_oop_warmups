require_relative 'rod.rb'

class TowerOfHanoi
  def initialize(disks=3)
    @rod_one = Rod.new
    @rod_two = Rod.new
    @rod_three = Rod.new

    i = disks
    disks.downto(1) do |i|
      @rod_one.add_disk(i)
    end
  end

  def reset_board
    @rod_one.reset
    @rod_two.reset
    @rod_three.reset
  end
end

TowerOfHanoi.new