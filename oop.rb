require 'time.rb'

def reverse(str)
  ans = []
  str =  str.chars

  str.length.downto(0) do  |x|
    ans <<  str[x]
  end
  ans.join

end

def fibonacci (num)
	#count = 1
	arr = [0,1]
	# while count < num
	# 	arr << arr[count] + arr[count-1]
	# 	count += 1
	# end
	for i in 1..(num-2)
		arr << arr[i] + arr[i-1]
	end
	arr
	# why does it have to be num-1?
end

def my_benchmark(number_of_times, &block)
	start_time = Time.now
	number_of_times.times do
		yield
	end
	end_time = Time.now
	end_time - start_time
	# how do we not puts?
end

class Array
	# att_accessor: @var
	def my_each(&block)
		self
	end
end