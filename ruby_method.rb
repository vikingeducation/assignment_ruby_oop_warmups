def my_reverse str
	result = ""
	(str.length-1).downto(0) { |index| result += str[index] }
	result
end

puts my_reverse "hello"


def fibo number
	fibonacci = [0,1]
	return 0 if number == 1
	return [0,1] if number == 2
	(number-2).times { fibonacci << fibonacci[-1]+fibonacci[-2]}
	fibonacci
end

puts fibo 7

def my_benchmark number_of_times
	time_start = Time.now
	number_of_times.times { |i| yield i }
	time_end = Time.now
	duration = time_end - time_start
end

puts my_benchmark(10000) { puts "hi" }