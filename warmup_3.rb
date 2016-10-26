# warmup_3


# my_each method

class Array
  def my_each
     # block/proc is implicit last argument
    count = 0
    while count < self.length
      item = self[count]
      yield(item)
      count = count + 1
    end
    self
  end
end

# main

[1,2,5].my_each{ |item| puts item }
# 1
# 2
# 5
#=> [1,2,5]
my_proc = Proc.new{|item| puts item**2}
#=> #<Proc:0x007fbb6b9c1cc8@(irb):2>
[1,2,5].my_each(&my_proc)
# 1

# ####################################

class Array
  def my_map
    result = []
    self.my_each do |item|
      result << yield(item)
    end 
    result 
  end
end

result = [1,2,5].my_map{ |item| item**3}


class Array
  def select
    result = []
    self.my_each do |item|
      if yield(item) == true
        result << item
      end
    end
    result 
  end
end

my_proc = Proc.new{|item| item.even?}
result = [1,2,5, 8, 10, 13].select(&my_proc)
#=> false


class Array
  def my_all?
    result = true
    self.my_each do |item|
      if yield(item) == false
        result = false
        break
      end
    end
    result 
  end
end

my_proc = Proc.new{|item| item.even?}
result = [1,2,5, 8, 10, 13].my_all?(&my_proc)
result = [2, 8, 10].my_all?(&my_proc)
#=> false


class Array
  def my_inject(memo)
    result = 0
    self.my_each do |item|
      memo = yield(memo, item)
      result = memo
    end
    result 
  end
end


[1,2,5].my_inject(0) do |memo, item|
  memo + item
end
#=> 8
