def reverse(str)
  ans = []
  str =  str.chars

  str.length.downto(0) do  |x|
    ans <<  str[x]
  end
  ans.join

end