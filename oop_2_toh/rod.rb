require_relative 'disk.rb'

class Rod
  def initialize
    @disks = []
  end

  def add_disk(disk)
    @disks.push(disk)
  end

  def render
    i = @disks.count - 1

    @disks.count.times do
      @disks[i].render
      i -= 1
    end
  end

  def reset
    @disks = []
  end
end