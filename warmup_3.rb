class Array
  def my_each
    arr = self
    counter = 0
    while counter < arr.size
      yield arr[counter]
      counter += 1
    end
    arr
  end

  def my_map
    arr = self
    new_arr = []
    counter = 0
    while counter < arr.size
      new_arr.push yield arr[counter]
      counter += 1
    end
    new_arr
  end

  def my_select
    arr = self
    new_arr = []
    counter = 0
    while counter < arr.size
      if yield arr[counter]
        new_arr.push arr[counter]
      end
      counter += 1
    end
    new_arr
  end

  def my_all?
    arr = self
    new_arr = []
    counter = 0
    while counter < arr.size
      if yield arr[counter]
        new_arr.push arr[counter]
      end
      counter += 1
    end
    new_arr == arr
  end

  def my_inject(init)
    arr = self
    counter = 0
    value = init
    while counter < arr.size
      value = yield value, arr[counter]
      counter += 1
    end
    value
  end
end

p [1,2,5].my_each { |item| puts item }
p [1,2,5].my_map  { |item| item ** 2 }
p [1,2,3,4].my_select { |item| item.even? }
p [1,2,3,4].my_all? { |item| item.even? }
p [2,4,6].my_all? { |item| item.even? }
p [1,2,5].my_inject(0) { |memo, item| memo + item }




