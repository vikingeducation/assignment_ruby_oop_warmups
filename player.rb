
class Player

  attr_accessor :choice

  def initialize
    @choice = nil
  end

  def make_choice

    @choice = gets.chomp.downcase

  end

end