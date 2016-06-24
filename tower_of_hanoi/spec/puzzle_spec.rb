require_relative "../lib/toh.rb"

describe Puzzle do
	it "is a Puzzle" do
		expect( subject ).to be_a( Puzzle )
	end

	it "creates a Puzzle" do
		expect do
			puzzle = Puzzle.new
		end.not_to raise_error
	end

	it "creates a puzzle with 3 towers" do
		puzzle = Puzzle.new
		expect(puzzle.board.size).to eq(3)
	end

	describe "#check_win" do
		it "returns false if the winning towers is not full" do
			puzzle = Puzzle.new

			expect(puzzle.check_win).to eq(false)
		end

		it "returns true if the winning tower is full" do
			puzzle = Puzzle.new
			puzzle.board[0].move_disk(puzzle.board[1])
			puzzle.board[0].move_disk(puzzle.board[2])
			puzzle.board[1].move_disk(puzzle.board[2])
			puzzle.board[0].move_disk(puzzle.board[1])

			expect(puzzle.check_win).to eq(true)
		end
	end


	describe "#render_board" do
		it "prints begining board" do
			puzzle = Puzzle.new

			expect{puzzle.render_board}.to output("*\n**\n***\n**** _  _  _ ").to_stdout
		end

		it "prints partial board" do
			puzzle = Puzzle.new
			puzzle.board[0].move_disk(puzzle.board[1])
			puzzle.board[0].move_disk(puzzle.board[2])
			puzzle.board[1].move_disk(puzzle.board[2])

			expect{puzzle.render_board}.to output("***\n**** _  _ *\n** _ ").to_stdout
		end
	end


end