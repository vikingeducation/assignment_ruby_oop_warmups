AI_move= Struct.new :disk, :from, :to do
  def execute
    $stacks[to] << $stacks[from].pop
  end
end

def spare_peg(from, to)
  # returns the peg that is not 'from' nor 'to'
  # e.g. if from="A", to="C" ... then spare="B"
  (0..2).each {|e| return e unless [from, to].include? e}
end

def hanoi(num, from, to)
  if num == 1 # base case
    return [AI_move.new(num, from, to)]
  end

  spare = spare_peg(from, to)
  moves = hanoi(num - 1, from, spare) # move everything to the spare peg
  moves << AI_move.new(num, from, to) # move the sole remaining disk to the 'to' peg
  moves += hanoi(num - 1, spare, to) # move all the disks on top of the 'to' peg
end

def ai_run
  hanoi($disks, 0, 2).each do |move|
    puts "\e[H\e[2J"
    turn_counter
    tower_view
    move.execute
  end
end
