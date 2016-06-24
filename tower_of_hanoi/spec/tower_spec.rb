require_relative "../lib/toh.rb"

describe Tower do
	it "is a Tower" do
		expect( subject ).to be_a( Tower )
	end

	it "accepts a disk array upon creation" do
		expect do
			xsmall_disk , small_disk, medium_disk, large_disk = Disk.new(1), Disk.new(2), Disk.new(3), Disk.new(4)
			starting_tower = true
			Tower.new([large_disk, medium_disk, small_disk, xsmall_disk],starting_tower)
		end.not_to raise_error
	end


	describe "#move_disk" do
		it "pops off of the from_tower and pushes it onto the to_tower" do
			xsmall_disk , small_disk = Disk.new(1), Disk.new(2)
			tower_a = Tower.new([small_disk, xsmall_disk])
			tower_b = Tower.new()

			tower_a.move_disk(tower_b)
			expect(tower_a.stack).to eq([small_disk])
			expect(tower_b.stack).to eq([xsmall_disk])
		end

		skip "does not move disk if invaild move is request" do
			xsmall_disk , small_disk = Disk.new(1), Disk.new(2)
			tower_a = Tower.new([small_disk])
			tower_b = Tower.new([xsmall_disk])

			expect{tower_a.move_disk(tower_b)}.to output("INVALID MOVE").to_stdout

		end
	end

	describe "#check_move" do
		it "returns true if move is valid compared tower doesn't have a large top disk" do
			xsmall_disk , small_disk = Disk.new(1), Disk.new(2)
			tower_a = Tower.new([small_disk, xsmall_disk])
			tower_b = Tower.new()

			expect(tower_b.check_move(tower_b)).to eq(true)
		end



		it "returns false if move is invalid" do
			xsmall_disk , small_disk = Disk.new(1), Disk.new(2)
			tower_a = Tower.new([small_disk])
			tower_b = Tower.new([xsmall_disk])

			expect(tower_b.check_move(tower_b)).to eq(false)
		end
	end

	describe "#render_tower" do
		it "displays empty tower width at the begining" do
			expect(subject.render_tower).to eq("")
		end

		it "displays partial tower" do
			small_disk, medium_disk, large_disk = Disk.new(2), Disk.new(3), Disk.new(4)
			tower_a = Tower.new([large_disk, medium_disk, small_disk])
			expect(tower_a.render_tower).to eq("**\n***\n****")
		end

		it "displays full tower" do
			xsmall_disk , small_disk, medium_disk, large_disk = Disk.new(1), Disk.new(2), Disk.new(3), Disk.new(4)
			tower_a = Tower.new([large_disk, medium_disk, small_disk, xsmall_disk])
			expect(tower_a.render_tower).to eq("*\n**\n***\n****")
		end
	end

end