def my_reverse string
  result = ''
  string.length.times { |index| result += string[(-index - 1)]}
  result
end

# puts my_reverse('Blah! and another blah?')

def fibs elements
  result = [0, 1]
  (elements - 2).times { |i| result << result[-1] + result[-2]}
  result
end

# puts fibs(3).to_s
# puts fibs(8).to_s

def my_benchmark number_of_times, &block
  start = Time.now
  number_of_times.times { yield }
  Time.now - start
end

# puts my_benchmark(10000) { puts "hi" }