#!/usr/bin/ruby

def my_reverse(phrase)
	reverse_phrase = []
	phrase.each_char do | char|
		reverse_phrase.unshift(char)
	end
	return reverse_phrase.join('')	
end

def fibonacci(number)
	return number if (0..1).include? number
	(fibonacci(number - 1) + fibonacci(number - 2))
end

def fibs(number)
	results = []
	i = 1
	while i <= number
		results[i] = fibonacci(i)
		i += 1
	end
	
	return results[1..number]
end

def my_benchmark(x = 0) 
	t = Time.now
	original_stdout = $stdout
	$stdout = File.new('/dev/null', 'w')
	if x > 0
		x.times { |i| yield }
		elapsed_time = ((Time.now - t).to_f)/x.to_f
	else
		yield
		 elapsed_time = Time.now - t
	end
	$stdout = original_stdout
	return elapsed_time
end

class Array
def my_each(proc_arg = self)
	
	if block_given?
		i = 0
		while i < self.length
			yield (self[i])
			i += 1
		end
	else
		proc_arg.call
	end
	self
end	
end
puts my_reverse("Blah!")
puts fibs(8)
puts my_benchmark(10000) {puts "hi" }
[1,2,5].my_each { |item| puts item }
my_proc = Proc.new{ |item| puts item ** 2}
[1,2,5].my_each(&my_proc)
