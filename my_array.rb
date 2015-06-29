class Array


  def my_each (proc = false)

    i = 0

    if block_given?

      while i < self.length

        yield self[i]

        i+=1

      end

    else

      while i < self.length

        proc.call(self[i])

        i+=1

      end

    end

    self

  end



  def my_map (proc)

    i = 0

    new_array = []

    while i < self.length

      new_array << proc.call(self[i])

      i+=1

    end

    new_array

  end



  def my_select(proc)

    new_array = []

    self.my_each() do |x|

      if proc.call(x)

        new_array << x

      end

    end

    new_array

  end



  def my_all?

    self.my_each do |x|

      if !yield x

        return false

      end

    end

    true

  end


  # def my_inject(initial)

  #   sum = initial

  #   self.my_each do |x|

  #     yield (sum,x)

  #   end

  #   sum

  # end



end

# Each Test
# my_proc_each = Proc.new {|item| puts item**2}
# puts [1, 2, 3].my_each()

# Map Test
# my_proc_each = Proc.new {|item| item*2}
# print [1, 2, 3].my_map(my_proc_each)

# Select Test
my_proc_each = Proc.new {|item| item.even?}
puts [1, 2, 3].my_select(my_proc_each)



# puts [1,2,5].my_inject(&my_proc)

