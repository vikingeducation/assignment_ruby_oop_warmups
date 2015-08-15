require_relative 'auth.rb'
require_relative 'controller.rb'
require_relative 'model.rb'
require_relative 'view.rb'

class Router
	attr_accessor :controller, :action, :notice

	def initialize(options={})
		@action = options[:action]
		@model = Model.new
		@view = View.new(:dir => 'views')
	end

	def route
		@view.notice = @notice
		@notice = nil
		@controller = Controller.new(
			:view => @view,
			:model => @model,
			:router => self
		)
		@controller.send(@action) if ! Input.quit?
	end
end