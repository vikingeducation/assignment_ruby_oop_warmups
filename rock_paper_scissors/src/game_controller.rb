class GameController < Controller
	def menu
		@view.render('game')
		@view.render('menu')
		@view.render('form')
		@router.action = :select_players
	end

	def play
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
				:hand_player_one => @view.render(
					@model.player_one,
					{},
					false
				),
				:hand_player_two => @view.render(
					@model.player_two,
					{},
					false
				)
			)
		else
			shoot = @model.shoot
			@view.render('winner',
				:winner => shoot[:winner],
				:winning_hand => @view.render(
					shoot[:winning_hand],
					{},
					false
				),
				:losing_hand => @view.render(
					shoot[:losing_hand],
					{},
					false
				)
			)
		end
		@view.render('over')
		@view.render('form')
		@router.action = :menu
		@model.clear
	end

	def select_players
		if @model.auth.valid_number_of_players?(Input.data)
			@model.num_players = Input.data
			@router.action = :play
		else
			@router.notice = @model.auth.error
			@router.action = :menu
		end
	end

	def one_player
		if @model.auth.valid_hand?(Input.data)
			@model.player_one = Input.data
			@model.player_two = ['1', '2', '3'].shuffle.first
			@router.action = :over
		else
			@router.notice = @model.auth.error
			@router.action = :play
		end
	end

	def two_player
		if @model.auth.valid_hand?(Input.data)
			@model.player_two = Input.data if @model.turn == '2'
			@model.player_one = Input.data if @model.turn == '1'
			@router.action = @model.player_one && @model.player_two ? :over : :play
		else
			@router.notice = @model.auth.error
			@router.action = :play
		end
	end
end