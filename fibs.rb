def fibs(x)
  first_fibs = [0, 1]
  arr_fibs = []
  x.times do |iterate|
    if iterate < 2
      arr_fibs << first_fibs[iterate]
    else
      arr_fibs << (arr_fibs[iterate-1] + arr_fibs[iterate-2])
    end
  end
  arr_fibs
end