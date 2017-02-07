require_relative 'disk.rb'

class Rod
  def initialize
    @disks = []
  end

  def push(disk)
    @disks.push(disk)
  end

  def count
    @disks.count
  end

  def top_disk
    @disks[-1]
  end

  def pop
    @disks.pop
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