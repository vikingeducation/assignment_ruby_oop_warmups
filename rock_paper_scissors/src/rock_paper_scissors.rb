require_relative 'router.rb'
require_relative 'input.rb'

class RockPaperScissors
	def initialize
		reset
		listen
	end

	def reset
		@router = Router.new(:action => :menu)
	end

	def listen
		begin
			system('clear')
			@router.route
			reset if Input.reset?
		end while ! Input.quit?
		Input.data = nil
	end
end