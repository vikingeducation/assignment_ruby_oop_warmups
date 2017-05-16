#
# Class TowersOfHanoi provides TOH object
#
# @author Ben
#
class TowersOfHanoi

  attr_reader :discs, :moves

  # sets discs, base_disc_size = discs and moves = 0
  #
  # @param [int] discs number of discs to start with
  # 
  def initialize(discs = 3)
    @discs = discs

    # base disc will always be as wide as the number of discs
    @base_disc_size = discs
    @moves = 0
  end

  #
  # set up the towers as empty, then build the first one
  #
  #
  # @return [nil] nil
  # 
  def create_towers
    @towers = {
      0 => [],
      1 => [],
      2 => []
    }
    build_tower(1, @base_disc_size)
  end

  #
  # builds the given tower with the given number of discs
  #
  # @param [int] tower tower number to build
  # @param [int] discs OPTIONAL [=0] number of discs to build on tower
  #
  # @return [nil] nil
  # 
  def build_tower(tower, discs = 0)
    discs.downto(1) { |n| @towers[tower].push(n) }
    nil
  end

  # move
  # validate move
  # check for winner
  # render towers


  def instructions
    puts 'Welcome to Towers Of Hanoi!'
    puts "Enter where you'd like to move from and to, ie. #move(1,3)."\
      "\nUse #quit to quit."
  end
end
