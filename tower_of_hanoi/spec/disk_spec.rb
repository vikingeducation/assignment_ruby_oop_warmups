require_relative '../lib/disk.rb'

describe "Disk" do
	before do
		@disk_1 = Disk.new(1)
		@disk_2 = Disk.new(2)
		@disk_3 = Disk.new(3)
		@disk_4 = Disk.new(4)
	end

	it "disk size init with creation" do
		expect(@disk_1.size).to eq(1)
		expect(@disk_2.size).to eq(2)
		expect(@disk_3.size).to eq(3)
		expect(@disk_4.size).to eq(4)
	end

	it "Compare Disk size to other disk size" do
		expect(@disk_1.compare_size(@disk_2.size)).to eq(-1)
		expect(@disk_1.compare_size(@disk_2.size)).not_to eq(0)
		expect(@disk_3.compare_size(@disk_2.size)).to eq(1)
		expect(@disk_4.compare_size(@disk_1.size)).to eq(3)
	end
end