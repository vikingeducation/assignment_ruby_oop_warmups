def my_reverse(string)
	reversed = ''
	(string.length - 1).downto(0) do |i|
		reversed += string[i]
	end
	reversed
end

def fibs(depth=5)
	results = []
	fib = lambda do |n|
		return n if n == 0 || n == 1
		return fib.call(n-1) + fib.call(n-2)
	end
	depth.times do |i|
		results << fib.call(i)
	end
	results
end

def benchmark(n=1)
	before = Time.now
	n.times do
		yield
	end
	after = Time.now
	elapsed = after - before
end