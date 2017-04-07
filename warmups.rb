

def my_reverse(input_string)
  output_string = ''
  (input_string.length - 1).downto(0) { |index| output_string << input_string[index] }
  output_string
end

def fibs(max_fibs)
  fib_output = [0, 1]
  while fib_output.length < max_fibs
    fib_output.push(fib_output[-2] + fib_output[-1])
  end
  fib_output
end

def my_benchmark(iterations)
  start_time = Time.now
  iterations.times { yield }
  Time.now - start_time
end

class Array
  def my_each(submitted_proc = nil)
    size.times { |index| block_given? ? yield(self[index]) : submitted_proc.call(self[index]) }
    self
  end

  def my_map(submitted_proc = nil)
    size.times { |index| block_given? ? self[index] = yield(self[index]) : self[index] = submitted_proc.call(self[index]) }
    self
  end

  def my_select(submitted_proc = nil)
    output = []
    size.times { |index| block_given? ?
      ( yield(self[index]) ? output << self[index] : next   ) :
      ( submitted_proc.call(self[index]) ? output << self[index] : next )}
    output
  end

  def my_all?(submitted_proc = nil)
    size.times { |index| block_given? ?
      ( yield(self[index]) ? next : (return false)   ) :
      ( submitted_proc.call(self[index]) ? next : (return false))}
    true
  end

  def my_inject(output = self[0], submitted_proc = nil)
    block_given? ? size.times { |index| output = yield(output, self[index]) } :
      size.times { |index| output = submitted_proc.call(output, self[index]) }
    output
  end

end
