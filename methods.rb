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
	i = 0	
	if block_given?
		while i < self.length
			yield (self[i])
			i += 1
		end
	else
		while i < self.length
			proc_arg.call(self[i])
			i +=1
		end
	end
	return self
end	

def my_map(map_items = self)
	map_arr = Array.new
	map_items.size.times do | item |
		map_arr.push(yield(map_items[item]))
	end
	return map_arr
end

def my_select(my_proc = self)
	sel_arr = Array.new
	self.size.times do | item |
		sel_arr << self[item] if my_proc.call(self[item])
	end
	return sel_arr
end

def my_all?(my_proc = self)
	check_all = nil
	self.my_each do | item |
		check_all = my_proc.call(item)
		break if check_all == false
	end
	return check_all

end

def my_inject(sum=0)
	self.my_each do | item |
		sum = yield(sum, item)
	end
	puts sum
	return sum

end
end
puts my_reverse("Blah!")
puts fibs(8)
puts my_benchmark(10000) {puts "hi" }
[1,2,5].my_each { |item| puts item }
my_proc = Proc.new do | item |
	puts item ** 2
end
[1,2,5].my_each(my_proc)
[1,2,5].my_map do | item |
	item ** 2
end
my_proc = Proc.new do | item |
	item.even?
end
puts [1,2,5].my_select(my_proc)
puts [1,2,5].my_all?(my_proc)
[1,2,5].my_inject(0) do | memo, item |
	memo + item
end
