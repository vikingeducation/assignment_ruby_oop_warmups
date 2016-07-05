class Array
#[1,2,5]
  def my_each(&block)
    index = 0
    while index < self.length
      yield self[index]
      index += 1
    end
    self
  end

  def my_map(&block)
    temp_arr = []
    self.my_each {|num| temp_arr << yield(num)}
    print temp_arr, "\n"
  end
end

[1,2,5].my_map do |item|
  item ** 2
end