
class ComputerPlayer
  attr_accessor :choice

  def initialize
    @choice = choice
  end

  def get_decision
    @choice = ["p","r","s"][rand(3)]
  end

end