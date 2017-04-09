def my_reverse(a_string)
  a_string.length == 1 ? a_string : a_string[-1] + my_reverse(a_string[0..-2])
end

TEST_STRING = "This is the day the Lord has made."

puts my_reverse(TEST_STRING)
