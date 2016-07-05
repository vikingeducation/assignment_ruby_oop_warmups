def reverse(string)
  result = ""
  counter = string.length-1
  while counter >= 0
    result += string[counter]
    counter -= 1
  end
  result
end

def fibs(num)
  result = [0,1]
  return [0] if num == 1
  while result.length < num
    to_be_pushed = result[-1] + result[-2]
    result.push to_be_pushed
  end
  result
  # while result.length < num
  #   to_be_pushed = result[-1] + result[-2]
  #   result.to_be_pushed
  # end
  # each time after 2, add the previous two nums, and push to the result
end

def my_benchmark(number_of_times)
  start_time = Time.now
  number_of_times.times do
    yield
  end
  Time.now - start_time
end

class Array
  
  def my_each(prc=nil)
    counter = 0
    if block_given?
      while counter < length
        yield self[counter]
        counter += 1
      end
    else
      return nil if !prc
      while counter < length
        prc.call self[counter]
        counter += 1
      end
    end
    self
  end

  def my_map(&block) 
    result = []
    my_each { |e| result.push (block.call e)}
    result
  end

  def my_select(&block)
    result = []
    my_each { |e| result.push e if block.call(e) }
    result
  end

  def my_all?(&block)
    my_each { |e| return false if !block.call(e) }
    return true
  end

  def my_inject(start, &block)
    current = start
    my_each { |e| current = block.call(current,(e)) }
    current
  end

end

def test
  puts (reverse "hello") == "olleh"
  puts fibs(3) == [0,1,1]
  puts fibs(8) == [0,1,1,2,3,5,8,13]
  puts my_benchmark(10000) { puts "hi" } 
  my_proc = Proc.new{|item| puts item**2}
  puts [1,2,5].my_each my_proc
  puts [1,2,5].my_map {|item| puts item**2}
  my_proc = Proc.new{|item| item.even?}
  puts [1,2,5].my_select(&my_proc)
  my_proc = Proc.new{|item| item.even?}
  puts [1,2,5].my_all?(&my_proc)
  puts [1,2,5].my_inject(0) { |memo, item| memo + item }
end

test