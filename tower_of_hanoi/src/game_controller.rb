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
		@model.difficulty = Input.data
		if @model.difficulty
			@router.action = :play
		else
			Input.notice = @model.validation.error
			@router.action = :menu
		end
	end

	def select_from
		@model.from = Input.data
		unless @model.from
			Input.notice = @model.validation.error
		end
		@router.action = :play		
	end

	def select_to
		@model.to = Input.data
		if Input.clear?
			@model.oops
			@router.action = :play
		elsif @model.to
			@model.move!
			@router.action = @model.win? ? :game_over : :play
		else
			Input.notice = @model.validation.error
			@router.action = :play
		end
	end
end