class Player

  def initialize

    @health = 100

  end

  def take_damage(dmg)

    @health -= dmg

  end

  def health
    @health
  end

  def dead?

    return true if @health <= 0
    return false if @health > 0

  end




end