class Array

  def my_each(&proc)

    counter = 0
    while counter < self.length
      block_given? ? yield(self[counter]) : proc.call(self[counter])
      counter += 1
    end

  end

  # my map
  def my_map(&proc)
    result = []
    self.my_each do |elem|
      if block_given?
        result << yield(elem)
      else
        result << proc.call(elem)
      end
    end
    result
  end

  def my_select(&proc)
    result = []

    self.my_each do |elem|
      # if the function given returns true, push to array
      if block_given?
        result << elem if yield(elem)
      else
        result << elem if proc.call(elem)
      end
    end

    result
  end # my_select

  def my_all?(&proc)
    self.my_each do |elem|
      if block_given?
        yield(elem) ? next : (return false)
      else
        proc.call(elem) ? next : (return false)
      end
    end

    true
  end

  # do your own
  # def my_inject(memo=nil)
  #   self.my_each do |item|
  #     memo = (memo ? yield(memo, item) : self[0])
  #   end
  #   memo
  # end

  def my_inject(memo=nil, &proc)
    if !memo
      memo = 0
    end
    self.my_each do |elem|
      if block_given?
        memo = yield(memo, elem)
      else
        memo = proc.call(memo, elem)
      end
    end
    memo
  end

  # RPS

  # Tower of Hanoi

end