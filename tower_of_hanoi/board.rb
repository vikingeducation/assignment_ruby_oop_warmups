class Board
  def initialize(height)
    @height = height
    @state = [(1..height).to_a.reverse, [], []]
  end

  def update!(input)
    @state[input[2].to_i - 1] << @state[input[0].to_i - 1].pop
  end

  def valid_move?(input)
    from = @state[input[0].to_i - 1]
    to = @state[input[2].to_i - 1]
    return false if from.empty?
    return true if to.empty?
    return false if from[-1] > to[-1]    
    true
  end

  def win?
    return true if @state[1].size == @height 
    return true if @state[2].size == @height
    false
  end

  def render
    puts "Current Board:"
    spacing = @height + 2
    # i = tower (column) index, j = row index
    # building complete rows first
    j = @height - 1
    while j >= 0 
      i = 0
      while i < 3
        if @state[i][j] != nil 
          print ("o"*@state[i][j]).ljust(spacing)
        else
          print "".ljust(spacing)
        end
        i += 1
      end 
      puts "\n"
      j -= 1
    end
    puts "1".ljust(spacing)+"2".ljust(spacing)+"3".ljust(spacing)
  end
end