
def fibs(number)
  seq = [0,1]
  if number==1
    seq.pop
  else
    (number-2).times do
      seq.push(seq[-1] + seq[-2])
    end
  end
  return seq
end

puts "How long should the fib sequence be?"
input=gets.chomp.to_i
puts "#{fibs(input)}"
