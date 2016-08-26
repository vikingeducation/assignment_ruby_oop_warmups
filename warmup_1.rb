def my_reverse(word)

  chars = word.chars
  chars_length = chars.length
  out_array = Array.new(chars_length)

  chars.each do |e|
    out_array[chars_length] = e
    chars_length -= 1
  end
  reversed_word = out_array.join
end

def fibonacci(fib_length)

  current_num = 1
  previous_num = 0
  next_num = 1
  fib_nums = [0, 1]

  (fib_length-2).times do
    fib_nums.push(previous_num + current_num)
    previous_num = current_num
    current_num = next_num
    next_num = previous_num + current_num
  end

  fib_nums
end

p my_reverse("reverse!")

p fibonacci(8)