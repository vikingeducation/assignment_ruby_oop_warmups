class Array
  def my_each my_proc=nil
    self.length.times do |num|
      if block_given?
        yield(self[num])
      else
        my_proc.call(self[num])
      end
    end
  end
end

[1,2,5].my_each { |item| puts item}
my_proc = Proc.new { |item| puts item}

[1,2,5].my_each my_proc