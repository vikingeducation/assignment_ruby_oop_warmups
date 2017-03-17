class Array

  def my_map
    mutated_arr = []
    counter = 0
    while counter < self.length
      mutated_arr << yield(self[counter])
      counter += 1
    end
    mutated_arr
  end

  def my_each
   counter = 0
    while counter < self.length
      yield(self[counter])
      counter += 1
    end
    self
  end

  def my_select
    mutated_arr = []
    counter = 0
    while counter < self.length
      mutated_arr << (self[counter]) if yield(self[counter]) == true
      counter += 1
    end
    mutated_arr
  end

  def my_all
    counter = 0
    while counter < self.length
      return false if yield(self[counter]) == false
      counter += 1
    end
    true
  end

  def my_inject(total)
    counter = 0
    while counter < self.length
      total =+ yield(total,(self[counter]))
      counter += 1
    end
    total
  end
end

arr = [1,2,5]

arr.my_each {|ele|  ele * 2}
# returns an array with the original elements

arr.my_map {|ele|  ele * 2 }
# returns a mutated array

arr.my_select {|ele| ele.even?}
#returns an array of selected elements

words = %w[car dog house]
words.my_all {|ele| ele.length == 3}
# returns a boolean value

arr.my_inject(0) {|memo, ele| memo + ele}
# an accomulator is passed and a total value is returns


