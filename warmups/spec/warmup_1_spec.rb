require_relative '../warmup_1.rb'

describe "my_reverse" do
	it "Reverses single word" do
		word = "Blah!"
		expect(my_reverse(word)).to eq("!halB")
	end

	it "Fails if interger is specified" do
		word = 1
		expect(my_reverse(word)).to eq(nil)
	end
end

describe "fibs" do
	it "Sequences of Fibonacci Sequence" do
		expect(fibs(0)).to eq([0])
		expect(fibs(1)).to eq([0,1])
		expect(fibs(3)).to eq([0,1,1])
		expect(fibs(8)).to eq([0,1,1,2,3,5,8,13])
	end
end