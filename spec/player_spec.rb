require_relative '../player.rb'

describe "Computer" do
	attr_accessor :computer

	before do
		@computer = Computer.new()
	end

	it "computer should change selected item" do
		item_list = ['rock','paper','scissors']

		response  = computer.choose_item
		data = response[:data]

		expect(data).not_to be_nil
		expect(item_list.include?(data)).to eq(true)
		expect(response[:status]).to eq("SUCCESS")
		expect(response[:message]).to eq("ITEM_CHANGED")
	end

end

describe "Human" do
end

