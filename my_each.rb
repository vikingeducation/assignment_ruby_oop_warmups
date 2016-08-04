class Array
def my_each 
    length = self.length
    i = 0
    while i < length
      yield  self[i]
      i += 1
    end
  end
end
