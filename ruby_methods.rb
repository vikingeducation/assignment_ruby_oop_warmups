def my_reverse(str)
  arr = str.chars
  revarr = []
  i = 0 
  while !arr.empty?
	revarr << arr.pop
	i = i + 1
  end
  revarr.join("")
end

def fibs(num)
  f=[0,1]
  (2..num-1).each {|n| f[n]=f[n-1]+f[n-2]}
  f
end
