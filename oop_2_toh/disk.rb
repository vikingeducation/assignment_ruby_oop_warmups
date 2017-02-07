class Disk
  def initialize(size)
    @size = size
  end

  # TODO - Refactor render method for disks
  def render
    puts @size
  end

  def size
    @size
  end
end