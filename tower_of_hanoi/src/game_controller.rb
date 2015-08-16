class GameController < Controller
	def menu
		@view.render('game')
		@view.render('menu',
			:min_disks => GameModel.min_disks,
			:max_disks => GameModel.max_disks
		)
		@view.render('form')
		@router.action = :select_difficulty
	end

	def play
		@view.render('game')
		@view.render('play',
			:game => @model,
			:moves => @model.moves,
			:move_type => @model.from ? 'to' : 'from',
			:from => @model.from ? @model.from : '-'
		)
		@view.render('form')
		@router.action = :select_from if ! @model.from
		@router.action = :select_to if @model.from && ! @model.to
	end

	def game_over
		@view.render('game')
		@view.render('over',
			:game => @model,
			:moves => @model.moves
		)
		@view.render('form')
		@router.action = :menu
		@model.clear
	end

	def select_difficulty
		if @model.auth.valid_difficulty?(Input.data)
			@model.difficulty = Input.data
			@router.action = :play
		else
			@router.notice = @model.auth.error
			@router.action = :menu
		end
	end

	def select_from
		if @model.auth.valid_from?(Input.data)
			@model.from = Input.data
		else
			@router.notice = @model.auth.error
		end
		@router.action = :play		
	end

	def select_to
		if ['c', 'clear'].include?(Input.data)
			@model.oops
			@router.action = :play
		elsif @model.auth.valid_to?(Input.data)
			@model.to = Input.data
			@router.action = @model.win? ? :game_over : :play
		else
			@router.notice = @model.auth.error
			@router.action = :play
		end
	end
end