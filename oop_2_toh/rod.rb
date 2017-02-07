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

  def render(line_width, row)
    if count > row
      @disks[row].render(line_width)
    else
      print " " * line_width
    end
  end

  def reset
    @disks = []
  end
end