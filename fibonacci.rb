def fibs(number)
  fibonacci = [0,1]
  (number-2).times {|number| fibonacci << fibonacci[-2] + fibonacci[-1]}
  fibonacci
end


puts fibs(14)