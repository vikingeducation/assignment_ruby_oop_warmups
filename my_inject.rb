class Array
  def my_inject(memo = nil)
    each do |i|
      if memo == false 
        memo = self[0]
      else
        memo = yield(memo,i)
      end
      #memo = (memo ? yield(memo, i) : self[0])
    end
    memo
  end
end 

x = [1,2,5].my_inject(0) do |memo, item|
   memo + item
end
puts x