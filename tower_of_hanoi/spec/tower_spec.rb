require_relative '../lib/tower.rb'
require_relative '../lib/disk.rb'

describe "Tower" do

	before do
		@disk_1 = Disk.new(1)
		@disk_2 = Disk.new(2)
		@disk_3 = Disk.new(3)
		@disk_4 = Disk.new(4)
		@tower_a = Tower.new('A',[@disk_4,@disk_3,@disk_2,@disk_1])
		@tower_b = Tower.new('B')
		@tower_b = Tower.new('C')
	end

	to "Tower intilization" do
		expect(@tower_a.name).to eq('A')
		expect(@tower_a.disk_set.size).to eq(4)
		expect(@tower_a.row_size).to eq(4)

		expect(@tower_b.name).to eq('B')
		expect(@tower_b.disk_set.size).to eq(0)

		expect(@tower_c.name).to eq('C')
		expect(@tower_c.disk_set.size).to eq(0)
	end

	to "Push disk" do
		to "Check rows size before disk push" do
			expect(@tower_a.row_size) eq(4)
			expect(@tower_b.row_size) eq(0)
			expect(@tower_c.row_size) eq(0)
		end

		to "Pushes disk onto tower" do
			@tower_b.disk_push(@disk_1)
			expect(@tower_b.disk_set).to eq([@disk_1])

			@tower_c.disk_push(@disk_2)
			@tower_c.disk_push(@disk_1)
			expect(@tower_c.disk_set).to eq([@disk_2,@disk_1])
		end

		to "Check rows size after disk push" do
			expect(@tower_a.row_size) eq(4)
			expect(@tower_b.row_size) eq(1)
			expect(@tower_c.row_size) eq(2)
		end
	end

	to "Pop disk" do
		to "Check rows size before disk pop" do
			expect(@tower_a.row_size) eq(4)
			expect(@tower_b.row_size) eq(1)
			expect(@tower_c.row_size) eq(2)
		end

		to "Pushes disk onto tower" do
			@tower_a.disk_pop()
			expect(@tower_a.disk_set).to eq([@disk_4,@disk_3,@disk_2])

			@tower_a.disk_pop()
			expect(@tower_a.disk_set).to eq([@disk_4,@disk_3])

			@tower_c.disk_pop(@disk_2)
			@tower_c.disk_pop(@disk_1)
			expect(@tower_c.disk_set).to eq([])
		end

		to "Check rows size after disk push" do
			expect(@tower_a.row_size) eq(2)
			expect(@tower_b.row_size) eq(1)
			expect(@tower_c.row_size) eq(0)
		end
	end

end