
def my_reverse(str)
  str_reversed = ''
  (str.length-1).downto(0) { |index| str_reversed << str[index] }
  str_reversed
end

def fibs(order)
  fibo = [0]
  while fibo.length < order
    fibo << fibo[-1]  + ( fibo[-2] == nil ? 1 : fibo[-2])
  end
  fibo
end
