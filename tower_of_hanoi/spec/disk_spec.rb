require_relative '../lib/disk.rb'

describe "Disk" do
	it "disk size init with creation" do
		disk_1 = Disk.new(1)
		disk_2 = Disk.new(2)
		disk_3 = Disk.new(3)
		disk_4 = Disk.new(4)

		expect(disk_1.size).to eq(1)
		expect(disk_2.size).to eq(2)
		expect(disk_3.size).to eq(3)
		expect(disk_4.size).to eq(4)
	end
end