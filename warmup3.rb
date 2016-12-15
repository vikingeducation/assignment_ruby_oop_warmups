require 'pry'
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
      if ( block_given? && yield(n) ) || (prock != nil && prock.call(n))
        selected << n
      end
    end
    selected
  end

  def my_all?(prock = nil,  &block)
    # procked version
    prock = block ? block : prock
    if !prock.nil?
      self.my_each do |n|
        return false if prock.call(n) == false
      end
    end
    true
  end

  def my_inject(memo=0, prock = nil, &block )
    binding.pry
    # procked version
    self.my_each do |n, m=memo|
      memo = yield(m, n)
    end
    memo
  end

end
