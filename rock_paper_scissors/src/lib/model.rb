class AppError < StandardError
	def initialize(message)
		super(message)
	end
end

class Model
	def initialize(options={})
		@auth = options[:auth] ? options[:auth] : Auth.new
		clear
	end

	def clear
	end
end
