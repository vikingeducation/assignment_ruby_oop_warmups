class Array
#[1,2,5]
  def my_each(&block)
    index = 0
    while index < self.length
      yield self[index]
      index += 1
    end
  end
end

[1,2,5].my_each{ |item| puts item}

my_proc = Proc.new{|item| puts item**2}

[1,2,5].my_each(&my_proc)