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

end
