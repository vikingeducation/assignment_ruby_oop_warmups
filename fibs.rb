def fibs(num)
  if num == 1
    [0] # by definition
  elsif num == 2
    [0, 1] # by definition
  else
    result = [0,1]

    #iterate through and add sum of previous 2 indexes
    (2...num).each do |index|
      result << (result[index - 1] + result[index - 2])
    end
    result
  end
end

p fibs(3)
p fibs(8)
