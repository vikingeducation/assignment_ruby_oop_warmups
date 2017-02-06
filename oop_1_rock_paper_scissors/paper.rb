require_relative 'rock.rb'
require_relative 'scissors.rb'

class Paper
  def beats?(item)
    !item.beatsPaper?
  end

  def beatsRock?
    true
  end

  def beatsPaper?
    false
  end

  def beatsScissors?
    false
  end
end