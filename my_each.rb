def my_each(things)
  i = 0
  while i < things.length do
    yield(things[i])
    i += 1
  end
  things
end

# Just for the heck of it

def my_recursive_each(things, returns = [], &block)
  if things.length > 0
    yield(things[0])
    my_recursive_each(things[1..-1], returns.push(things[0]), &block)
  else
    returns
  end
end

my_each([1,2,3]) { |x| puts("Hi #{x}") }

returned_array = my_recursive_each([2,3,4])  { |x| puts("Hi recursive #{x}") }

print(returned_array)
