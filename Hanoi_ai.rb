AI_move= Struct.new :disk, :from, :to do
  def execute
    $stacks[to] << $stacks[from].pop
  end
end

def spare_peg(from, to)
  (0..2).each {|e| return e unless [from, to].include? e}
end

def hanoi(num, from, to)
  if num == 1 # base case
    return [AI_move.new(num, from, to)]
  end

  spare = spare_peg(from, to)
  moves = hanoi(num - 1, from, spare)
  moves << AI_move.new(num, from, to) 
  moves += hanoi(num - 1, spare, to) 
end

def ai_run
  hanoi($disks, 0, 2).each do |move|
    puts "\e[H\e[2J"
    turn_counter
    tower_view
    move.execute
  end
end
