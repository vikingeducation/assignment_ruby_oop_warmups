def my_reverse(string)
  arr = string.split("")
  new_arr = []

  arr.each do |i|
    new_arr.unshift(i)
  end
  new_arr.join

end



def fib_rec(int)
  return int if (0..1).include? int
  (fib_rec(int-1) + fib_rec(int-2))
end



def fibs(int)
  arr = []
  (0..int).each do |number| 
    arr.push(fib_rec(number))
  end
  return arr

end
