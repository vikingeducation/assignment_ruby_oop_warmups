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

	def game
		@view.render('game')
		@view.render('play',
			:game => @model.to_s,
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
			:game => @model.to_s,
			:moves => @model.moves
		)
		@view.render('form')
		@router.action = :menu
		@model.clear
	end

	def select_difficulty
		begin
			@model.difficulty = Input.data
		rescue AppError => e
			@router.notice = e
			@router.action = :menu
		else
			@router.action = :game
		end
	end

	def select_from
		begin
			@model.from = Input.data
		rescue AppError => e
			@router.notice = e
		end
		@router.action = :game
	end

	def select_to
		begin
			if ['c', 'clear'].include?(Input.data)
				@model.oops
			else
				@model.to = Input.data
			end
		rescue AppError => e
			@router.notice = e
			@router.action = :game
		else
			@router.action = @model.win? ? :game_over : :game
		end
	end
end