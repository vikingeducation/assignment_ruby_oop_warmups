def fibs(num)
  arr = []
  num.times do |i|
  	if arr[0] == nil && arr[1] == nil
      arr << 0
      arr << 1
	   else
      arr << arr[- 1] + arr[- 2]
  	end
  end
  puts arr.join(" ")
end


fibs(3)
