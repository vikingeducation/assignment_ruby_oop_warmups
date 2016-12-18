def fibs(x)
  first_fibs = [0, 1]
  arr_fibs = []
  x.times {|iterate| iterate < 2 ? arr_fibs << first_fibs[iterate] : arr_fibs << (arr_fibs[iterate-1] + arr_fibs[iterate-2])}
  arr_fibs
end