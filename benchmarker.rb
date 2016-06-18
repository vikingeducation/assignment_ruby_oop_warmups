#Warmup 2: Benchmarker

#Write a method, my_benchmark, that takes a parameter number_of_times and a block and returns how long that block took to run that block, that many times. Remember, you can get the current time using Time.now, and you can subtract one time from another to get a duration in seconds.


require 'time'

require 'pry'


# PROGRAM benchmark( times , &block )
def benchmark ( num )

	# create a start time
	start_time = Time.now
	# start the loop n.times
		# and run the block
	num.times { yield if block_given? }
	# return the time.now - start time

	puts Time.now - start_time

end
# END

benchmark( 100000 ) { puts "Hi" }