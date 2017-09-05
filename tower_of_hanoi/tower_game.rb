class TowerGame
  def initialize(stack_num)
    @stack_num = stack_num
    @a = []
    @b = []
    @c = []
    i = @stack_num.to_s.dup
    i = i.to_i
    while i > 0
      @a << i.to_s
      i.to_i
      i -= 1
    end
  end

  def prompt_move
    p "Here is your current progress"
    sleep(2)
    p "a = #{@a}"
    sleep(1)
    p "b = #{@b}"
    sleep(1)
    p "c = #{@c}"
    sleep(1)
    p "Which array do you want to move a stack from first?"
    sleep(1)
    p "Press 'a' for a"
    sleep(1)
    p "Press 'b' for b"
    sleep(1)
    p "Press 'c' for c"
    @input = gets.chomp
    return @input
  end

  def stack_move(input)
    if input == 'a'
      @move = @a.pop
    elsif input == 'b'
      @move = @b.pop
    elsif input == 'c'
      @move = @c.pop
    end
    p "a = #{@a}"
    sleep(1)
    p "b = #{@b}"
    sleep(1)
    p "c = #{@c}"
    sleep(1)
    p "Which array do you want to move this stack '#{@move}' to?"
    sleep(1)
    p "Press 'a' for a"
    sleep(1)
    p "Press 'b' for b"
    sleep(1)
    p "Press 'c' for c"
    @to = gets.chomp
    if @to == 'a'
      @a << @move
    elsif @to == 'b'
      @b << @move
    elsif @to == 'c'
      @c << @move
    end
    p "Nice!"
    p "Your arrays now look like this:"
    p "a = #{@a}"
    sleep(1)
    p "b = #{@b}"
    sleep(1)
    p "c = #{@c}"
  end

  def check
    if @a == [] && @b == [] && @c == @c.sort
      p "You win!"
      return true
    else
      return false
    end
  end

end
