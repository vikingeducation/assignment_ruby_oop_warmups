require_relative 'rock.rb'
require_relative 'paper.rb'

class Scissors
  def beats?(item)
    !item.beatsScissors?
  end

  def beatsRock?
    false
  end

  def beatsPaper?
    true
  end

  def beatsScissors?
    false
  end
end