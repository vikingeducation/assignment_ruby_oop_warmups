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