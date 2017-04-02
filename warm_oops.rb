#Warm oops
#Eric Glover
#4/2/17

#TM T-Swift

##########  warm-up 1   #########

#reverse a string
def my_reverse( s )
  reversed_string = []

  #count down
  (s.length).downto(0) do |i|
    reversed_string << s[i]
  end

  return reversed_string
end

#print out the fibonacci sequence to the nth term (starting index = 1)
def fibonacci( n )
  current = 1
  previous = 1
  sequence = [1,1]

  #probably a cleaner way to handle these weird cases...but oh well
  if n == 1
    return 1
  elsif n == 2
    return sequence
  else
  end

  (n-2).times do |i|
    temp = current
    current = current + previous
    previous = temp
    sequence << current
  end
  return sequence
end

##########  warm-up 2   #########

def my_benchmark(number_of_times)
  #create current time
  start = Time.new
  number_of_times.times do
    yield
  end
  finish = Time.new
  elapsed_time = finish - start
end
#puts my_benchmark(10000) {puts "hi"}

##########  warm-up 3   #########
  ############ Rebuild Enumerables ############

#extends the array class, with new functionality that mimicks the Enumerable Module
class Array
  def my_each(proc_option = nil)
    i = 0
    while i < self.size
      if block_given?
        yield(self[i])
      else
        proc_option.call(self[i])
      end
      i += 1
    end
    self
  end

  def my_map(proc_option = nil)
    new_map = []
    i = 0
    while i < self.size
      if block_given?
        new_map << yield(self[i])
      else
        new_map << proc_option.call(self[i])
      end
      i += 1
    end
    new_map
  end

end


#oop 1
#oop 2
