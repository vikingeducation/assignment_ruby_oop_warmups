class Controller
	attr_accessor :model, :view

	def initialize(options={})
		@model = options[:model]
		@view = options[:view]
		@router = options[:router]
	end
	
	def menu
		@view.render('game')
		@view.render('menu')
		@view.render('form')
		@router.action = :select_players
	end

	def game
		@view.render('game')
		@view.render('play',
			:turn => @model.turn
		)
		@view.render('form')
		@router.action = :one_player if ! @model.two_player?
		@router.action = :two_player if @model.two_player?
	end

	def over
		@view.render('game')
		if @model.tie?
			@view.render('tie',
				:hand_player_one => @view.render(@model.player_one, {}, false),
				:hand_player_two => @view.render(@model.player_two, {}, false)
			)
		else
			shoot = @model.shoot
			@view.render('winner',
				:winner => shoot[:winner],
				:winning_hand => @view.render(shoot[:winning_hand], {}, false),
				:losing_hand => @view.render(shoot[:losing_hand], {}, false)
			)
		end
		@view.render('over')
		@view.render('form')
		@router.action = :menu
		@model.clear
	end

	def select_players
		begin
			@model.num_players = Input.data
		rescue Exception => e
			@router.notice = e
			@router.action = :menu
		else
			@router.action = :game
		end
	end

	def one_player
		begin
			@model.player_one = Input.data
			@model.player_two = ['1', '2', '3'].shuffle.first
		rescue Exception => e
			@router.notice = e
			@router.action = :game
		else
			@router.action = :over
		end
	end

	def two_player
		begin
			@model.player_two = Input.data if @model.turn == '2'
			@model.player_one = Input.data if @model.turn == '1'
		rescue Exception => e
			@router.notice = e
			@router.action = :game
		else
			@router.action = @model.player_one && @model.player_two ? :over : :game
		end
	end
end
