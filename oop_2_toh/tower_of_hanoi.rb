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

  def instructions
    puts "\nWelcome to Tower of Hanoi!\n\n"
    puts "Instructions:\n\n"
    puts "Enter where you'd like to move from and to"
    puts "in the format '1,3'. Enter 'q' to quit."
  end
end

TowerOfHanoi.new