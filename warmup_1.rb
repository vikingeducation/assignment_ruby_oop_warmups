def my_reverse(str)
  reversed_str = ''
  index = -1
  while -index <= str.length 
    reversed_str << str[index]
    index -= 1 
  end 
  reversed_str
end

def fibs(elem_num)
  fib_nums = [0, 1]
  index = 1
  while fib_nums.length < elem_num
    fib_nums << fib_nums[index] + fib_nums[index - 1]
    index += 1
  end
  fib_nums
end