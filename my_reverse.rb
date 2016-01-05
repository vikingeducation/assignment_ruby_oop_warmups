def my_reverse(string)

  new_string = ""

  index = string.length-1
  until index == -1 
    new_string << string[index]
    index -=1
  end
  new_string
end


  
