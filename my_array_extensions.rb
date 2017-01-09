class Array
  def my_each(my_proc = nil)
    size.times do |i|
      yield(self[i]) if block_given?
      my_proc.call(self[i]) if my_proc
    end

    self
  end

  def my_map(my_proc = nil)
    mapped_array = []

    size.times do |ind|
      mapped_array << my_proc.call(self[ind]) if my_proc
      mapped_array << yield(self[ind]) if block_given?
    end

    mapped_array
  end

  def my_select(my_proc = nil)
    selected_array = []

    size.times do |ind|
      (selected_array << self[ind] if my_proc.call(self[ind])) if my_proc
      (selected_array << self[ind] if yield(self[ind])) if block_given?
    end

    selected_array
  end

  def my_all?(my_proc = nil)
    size.times do |ind|
      (return false unless my_proc.call(self[ind])) if my_proc
      (return false unless yield(self[ind])) if block_given?
    end

    true
  end

  def my_inject(base = nil, my_proc = nil)
    sum = base
    size.times do |ind|
      if sum.nil?
        sum = self[ind]
        next
      end
      sum = my_proc.call(sum, self[ind]) if my_proc
      sum = yield(sum, self[ind]) if block_given?
    end

    sum
  end
end
