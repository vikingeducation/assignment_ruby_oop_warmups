def My_reverse string
  string = string.split("")
  new_string = []
  string.length.times do |i|
    new_string[i] = string.pop
  end
  new_string = new_string.join
  new_string
end

def fibs number
  fib=[0,1]
  time=number-2
    time.times do
      value= fib[fib.length-1]+fib[fib.length-2]
      fib << value
    end
    return fib
  end
