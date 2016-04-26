class TowerOfHanoi
  ## Class Variables
  @@messages = {
    new_game: "Welcome to the Tower of Hanoi!",
    prompt_user: "Enter where you'd like to move from and to\nin the format [1,3]. Enter 'q' to quit.",
    winner: "Congratulations! You have won the game!",
    quit: "You have quit the game.\nHope to see you again!",
    illegal_move: "You can't add a bigger piece atop a smaller piece.\nPlease try again.",
    starting_message: "How many pieces would you like in your Tower of Hanoi?"
  }

  attr_reader :towers, :complete_tower
  attr_accessor :counter

  def initialize(pieces)
    @complete_tower = pieces.downto(1).to_a
    @towers = (1..3).each_with_object({}) { |num, tower| tower[num] = [] }
    @towers[1] = @complete_tower.dup
    @counter = 0
  end

  def move(from, to)
    if !towers.include?(from)
      puts "Tower #{from} doesn't exist. Try again."
    elsif !towers.include?(to)
      puts "Tower #{to} doesn't exist. Try again."
    elsif from.equal?(to)
      puts "You have selected the same tower. Try again."
    elsif tower(to).any? && tower(to).last < tower(from).last
      puts @@messages[:illegal_move]
    else
      tower(to) << tower(from).pop
      self.counter += 1
    end
  end

  def over?
    complete_tower == tower(2) || complete_tower == tower(3)
  end

  def tower(number)
    towers[number]
  end

  def self.messages
    @@messages
  end

end
