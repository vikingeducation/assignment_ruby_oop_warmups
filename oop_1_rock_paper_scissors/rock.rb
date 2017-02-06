require_relative 'paper.rb'
require_relative 'scissors.rb'

class Rock
  def beats?(item)
    !item.beatsRock?
  end

  def beatsRock?
    false
  end

  def beatsPaper?
    false
  end

  def beatsScissors?
    true
  end
end