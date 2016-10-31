def my_reverse(input)
  input_array = input.split('')
  output_array = []
  while input_array.length > 0
    x = input_array.pop
    output_array.push(x)
  end
  return output_array.join('')
end

def fibs(number)
  fib_array = [0, 1]
  if number == 0
    return []
  elsif number == 1
    return [0]
  else
    while fib_array.length < number
      new_number = fib_array[-2] + fib_array[-1]
      fib_array.push(new_number)
    end
  end
  return fib_array
end
