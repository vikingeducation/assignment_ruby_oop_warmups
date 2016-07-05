def my_reverse(str)
  result = []
  str.chars.each{ |letter| result.unshift(letter) }
  result.join('')
end

def fibs(num)
  fibbs = [0,1]
  return fibbs[0] if num == 1
  (num - 2).times do
    fibbs << fibbs[-1] + fibbs[-2]
  end
  fibbs
end

def my_benchmark(num)
  t = Time.now
  num.times {yield}
  Time.now - t
end


class Array

  def my_each(proc_argument=nil)

    if block_given?

      self.length.times do |n|
        yield (self[n])
      end

    else
      self.length.times do |n|
        proc_argument.call(self[n])
      end
    end

  end

  def my_map
    result = []
    self.my_each { |n| result << yield(n) }
    result
  end

  def my_select(proc = nil)
    result = []
    if block_given?
      self.my_each { |n| result << n if yield(n) }
    else
      self.my_each { |n| result << n if proc.call(n) }
    end
    result
  end

  def my_all?(proc = nil)
    if block_given?
      self.my_each { |n| return false unless yield(n) }
    else
      self.my_each { |n| return false unless proc.call(n) }
    end
    true
  end

  def my_inject(total = 0, proc = nil)
    total = total
    if block_given?
      self.my_each { |n| total = yield(total, n) }
    else
      self.my_each { |n| total = proc.call(total, n)}
    end
    puts total
  end

end


