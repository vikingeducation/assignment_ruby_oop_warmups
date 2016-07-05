class Array

  def my_each(&block)
    i = 0
    while i < length
      yield(self[i])

      i += 1
    end
    self
  end

  def my_map(&block)
    i = 0
    new_arr = self
    while i < length
      new_arr[i] = yield(self[i])
      i += 1
    end

    new_arr
  end

  def my_select(&block)
    new_arr =[]
    self.my_each {|ele| new_arr << ele if yield(ele)}
    new_arr
  end

  def my_all?(&block)
    false_flag = false
    self.my_each {|ele| false_flag = true if yield(ele) == false}
    return false if false_flag
    true
  end

  def my_inject(num = 0, &block)

    self.my_each {|ele| num = yield(num, ele)}
    num

  end

end

# p [1,2,3,4].my_each {|num| puts num}
#
# p [1,2,3].my_map {|num| num + 1}
# p [1,2,3,4].my_select {|num| num.even?}
# p [1, 2, 3].my_all? {|item| item.is_a? String}
#
[1, 1, 1].my_inject(0) do |memo, item|
  memo + item
end
