class TowerGame
  def initialize(stack_num)
    @stack_num = stack_num
    @a = []
    @b = []
    @c = []
    i = @stack_num.to_s.dup
    i = i.to_num
    while i > 0
      @a << i.to_s
      i.to_num
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
    p "Which array do you want to move this stack '#{move}' to?"
    sleep(1)
    p "Press 'a' for a"
    sleep(1)
    p "Press 'b' for b"
    sleep(1)
    p "Press 'c' for c"
    @to = gets.chomp
    if input == 'a'
      @a << @to
    elsif input == 'b'
      @b << @to
    elsif input == 'c'
      @c << @to
    end
  end

  def check(a, b, c)
    return "You win!" if a == [] && b == [] && c == c.sort
  end

end
