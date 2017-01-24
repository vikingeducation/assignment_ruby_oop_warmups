#reversed the given string

def my_reverse(string)
  result = ''
  #split string into array of chars
  arr = string.split('')
  #iterate backwards through array
  (arr.length-1).downto(0).each {|index| result << arr[index]}
  result

end


puts my_reverse("Blah!")
