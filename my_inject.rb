require "./my_each.rb"

class Array
  def my_inject(sum=0)
    self.my_each do |x|
      sum = yield(sum,x)
    end
    sum
  end
end

# [1,2,5].my_inject(0) do |memo, item|
#   memo + item
# end
#=> 8