class Disc
   attr_accessor :size
   include Comparable

   def initialize(size)
   	@size = size
   end

   def <=>(other_disc)
   		if @size == other_disc.size
   			return 0
   		elsif @size > other_disc.size
   			return 1
   		else
   			return -1
   		end			
   end
end	
