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

end

# p [1,2,3,4].my_each {|num| puts num}
#
p [1,2,3].my_map {|num| num + 1}
