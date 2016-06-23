require_relative "../lib/toh.rb"

describe Disk do
	it "is a disk" do
		expect( subject ).to be_a( Disk )
	end

	it "accepts a size upon creation" do
		expect do
			Disk.new(1)
		end.not_to raise_error
	end

	describe "#is_smaller?" do
		it "returns true if self is samller than campared disk" do
			small_disk = Disk.new(1)
			large_disk = Disk.new(4)

			expect(small_disk.is_smaller?(large_disk)).to eq(true)
		end

		it "returns false if self is larger than campared disk" do
			small_disk = Disk.new(2)
			large_disk = Disk.new(3)

			expect(large_disk.is_smaller?(small_disk)).to eq(false)
		end
	end

	describe "#render" do
		it "displays empty disk width at the begining" do
			expect(subject.render).to eq("")
		end

		it "displays disk width" do
			large_disk = Disk.new(4)
			expect(large_disk.render).to eq("****")
		end
	end
end