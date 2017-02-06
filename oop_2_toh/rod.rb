class Rod
  def initialize
    @disks = []
  end

  def add_disk(size)
    @disks.push(size)
  end

  def render
    @disks.each { |disk| disk.render}
  end
end