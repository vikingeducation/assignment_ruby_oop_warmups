require 'time.rb'

def my_reverse(word)
  arr = word.split("")
  getarr = []
  
  while arr.length != 0
    getarr.push(arr.pop())
  end
  
  str = getarr.join("")
  puts str
end

#my_reverse("Hello")

def fibs(int)
	array = []
	if int == 1
		array << 0
	elsif int > 1
		array << 0
		array << 1
    (2..(int - 1).each do |i|
			array << array[i - 1] + array[i - 2]
		end
	end
	array
end

def my_benchmark(n)
	start = Time.now
	n.times do 
		yield
	end
	Time.now - start
end
my_benchmark(10000) { puts "hi" }

