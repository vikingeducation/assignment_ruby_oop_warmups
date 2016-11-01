require './tower_controller'

class Tower
  def self.hard
    new(8)
  end
  def self.medium
    new(6)
  end
  def self.easy
    new(4)
  end
  def initialize level=2
    TowerController.new level
  end
end

Tower.easy