require 'pry'

def my_reverse(string)
  begin
    s_chars = string.chars
    s_chars.length.times do |i|
      s_chars.insert(i, s_chars.pop)
    end
    s_chars.join
  rescue NoMethodError => e
    puts "#{string} needs to be a string:\n" + e.backtrace.join("\n")
  end
end

def recursive_fibs(num)
  if num == 1 || num == 0
    num
  else
    recursive_fibs(num - 1) + recursive_fibs(num - 2)
  end
end

def fibs(n)
  fib = []
  n.times do |i|
    fib << recursive_fibs(i)
  end
  fib
end

def benchmarker(n)
  start = Time.now
  n.times { yield }
  Time.now - start
end

class Array

  def my_each(&proc)
    return to_enum :my_each unless proc

    self.length.times do |n|
      proc.call(self[n])
    end
    self
  end

  def my_map(&proc)
    return to_enum :my_each unless proc

    out = []
    my_each do |item|
      out << proc.call(item)
    end
    out
  end

  def my_select(&proc)
    return to_enum :my_each unless proc

    out = []
    my_each do |item|
      out << item if proc.call(item)
    end
    out
  end

  def my_all?(&proc)
    out = true
    return out unless proc

    my_each do |item|
      out = proc.call(item)
      break unless out
    end
    return out
  end

  def my_reduce(default = nil, &proc)
    default ? total = default : total = self[0]

    tail = self[1..-1]
    tail.my_each do |item|
      total = proc.call(total, item)
    end
    return total
  end
end
