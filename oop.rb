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

	def my_each(&block)
	   for i in 0...self.length
         yield(self[i])
      end
      return self
	end

  def my_map
    new_arr = []
    self.my_each do |item|
       new_arr << yield(item)
    end
    return new_arr
  end

  def my_select(&block)
    new_arr = []
    self.my_each do |item|
    	new_arr << item  if  block.call(item)
    end
    return new_arr
  end

 	def my_all?(&block)
	 	result = false
	 	self.my_each do |item|
	 		if block.call(item)
	 			result = true
	 		else
	 			return false
	 		end
	 	end
	 	return result
 	end


 	def my_inject(var = 0, &block)
 		result = var
 		self.my_each do |item|
 			result = block.call(result, item)
 		end
 		return result
 	end

end