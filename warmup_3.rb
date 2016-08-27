class MyArray < Array

  def my_each(in_arr)

    for i in 0...in_arr.length

      yield in_arr[i]
      
    end

    #puts in_arr
    in_arr
  end

  def my_map(in_arr)

    for i in 0...in_arr.length
      in_arr[i] = yield in_arr[i]
    end

    in_arr
  end

  def my_select(in_arr)

    out_arr = []
 
    for i in 1..in_arr.length
      condition_met = yield i
      out_arr << i if condition_met
    end

    out_arr
  end

  def my_all?(in_arr)
    truths = []
    
    for i in 0...in_arr.length
      truths.push(yield i)
    end

    for i in 0...truths.length
      if truths[i] == false
        return false
      else
        return true
      end
    end
  end

  def my_inject(in_arr)
    total = 0
    
    for i in 0..in_arr.length
      total = yield(total, in_arr[i].to_i)
    end
 
    total
  end

end


mine = MyArray.new

puts "\n\nMy each.............."
p mine.my_each([1,2,3,4]) { |e| e }

puts "\nMy map................."
p mine.my_map([1,2,3,4]) { |e| e ** 2 }

puts "\nMy select.............."
p mine.my_select([1,2,3,4]) { |e| e % 2 == 0 }

puts "\nMy all?................"
p mine.my_all?([1,2,3,4]) { |e| e < 10 }

puts "\nMy inject.............."
p mine.my_inject([1,2,3,4]) { |total,element| total += element }


