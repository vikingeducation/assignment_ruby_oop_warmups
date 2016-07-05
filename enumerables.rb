class Array

  def my_each(&block)
    i = 0
    while i < length
      yield(self[i])

      i += 1
    end
    self
  end


end

p [1,2,3,4].my_each {|num| puts num}