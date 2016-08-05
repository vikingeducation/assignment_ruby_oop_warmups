class Array
def my_each
    length = self.length
    i = 0
    while i < length
      yield  self[i]
      i += 1
    end
  end

def my_map
    self.length.times do |i|
      self[i] = yield self[i]
    end
    return self
end

def my_select
  select_itmes = []
  self.length.times do |i|
    result = yield self[i]
    if result == true
      select_itmes << self[i]
    end
  end
  return select_itmes
end

def my_all?

  self.length.times do |i|
    result = yield self[i]
    if result == false
      return false
    end
  end

    return true
  end

end
