require_relative 'disk.rb'

class Rod
  def initialize
    @disks = []
  end

  def push(disk)
    @disks.push(disk)
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