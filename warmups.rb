def my_reverse(string)
  forward_array = string.split("")
  backward_array = []
  forward_array.length.times do
    backward_array << forward_array.pop
  end
  backward_array.join
end

def fibs(number_of_values)
  if number_of_values == 1
    return [0]
  else
    sequence = [0,1]
    while sequence.length < number_of_values do
      sum = sequence.last + sequence[-2]
      sequence << sum
    end
    return sequence
  end
end

def my_benchmark(repeat)
  t0 = Time.now
  repeat.times do
    yield
  end
  Time.now - t0
end


class Array
  def my_each
    index = 0
    while index < self.length
      yield(self[index])
      index += 1
    end
    return self
  end

  def my_map
    modified_array = []
    self.my_each do |item|
      modified_array << yield(item)
    end
    modified_array
  end


end


