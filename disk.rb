
class Disk

  attr_accessor :size, :image

  def initialize(size)
    @size = size
    @image = "O" * @size
  end

end