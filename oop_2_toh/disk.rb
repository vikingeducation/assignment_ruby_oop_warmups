class Disk
  def initialize(size)
    @size = size
  end

  def render(line_width)
    disk_width = 1 + (@size - 1) * 2
    padding = (line_width - disk_width) / 2

    print " " * padding
    disk_width == 0 ? print(" ") : print("0" * disk_width)
    print " " * padding
  end

  def size
    @size
  end
end