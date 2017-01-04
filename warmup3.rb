class Array

  def my_each( prock = nil)
    i = 0
    while i < self.size
      if block_given?
        yield(self[i])
      else
        prock.call(self[i])
      end
      i += 1
    end
    self
  end

  def my_map( prock = nil)
    # use yield if block, use .call if prock
    mapped = []
    self.my_each do |n|
      if block_given?
        mapped << yield(n)
      else
        mapped << prock.call(n)
      end
    end
    mapped
  end

  def my_select( prock = nil)
    selected = []
    self.my_each do |n|
      if ( block_given? && yield(n) ) || (prock && prock.call(n))
        selected << n
      end
    end
    selected
  end

  def my_all?(prock = nil,  &block)
    # procked version
    prock = block ? block : prock
    if prock
      self.my_each do |n|
        return false unless prock.call(n)
      end
    end
    true
  end

  def my_inject(memo=0, prock = nil, &block )
    # procked version
    self.my_each do |n, m=memo|
      memo = yield(m, n)
    end
    memo
  end

end
