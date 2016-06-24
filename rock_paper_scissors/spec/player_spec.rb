require_relative '../lib/player.rb'

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

	it "computers game stats should increament" do
		expect(computer.total_wins).to eq(0)
		expect(computer.total_losses).to eq(0)
		expect(computer.total_ties).to eq(0)

		computer.add_win
		expect(computer.total_wins).to eq(1)
		computer.add_win
		computer.add_win
		expect(computer.total_wins).to eq(3)
		computer.add_loss
		expect(computer.total_losses).to eq(1)
		computer.add_loss
		computer.add_loss
		computer.add_loss
		computer.add_tie
		computer.add_tie
		expect(computer.total_losses).to eq(4)
		expect(computer.total_ties).to eq(2)
	end

end

describe "Human" do
	attr_accessor :human

	before do
		@player = Human.new('1')
	end

	it "human should change selected item" do
		item_list = ['rock','paper','scissors']

		response  = @player.choose_item(1)
		data = response[:data]

		expect(data).not_to be_nil
		expect(item_list.include?(data)).to eq(true)
		expect(response[:status]).to eq("SUCCESS")
		expect(response[:message]).to eq("ITEM_CHANGED")
	end

	it "Human game stats should increament" do
		expect(@player.total_wins).to eq(0)
		expect(@player.total_losses).to eq(0)
		expect(@player.total_ties).to eq(0)

		@player.add_win
		expect(@player.total_wins).to eq(1)
		@player.add_win
		@player.add_win
		expect(@player.total_wins).to eq(3)
		@player.add_loss
		expect(@player.total_losses).to eq(1)
		@player.add_loss
		@player.add_loss
		@player.add_loss
		@player.add_tie
		@player.add_tie
		expect(@player.total_losses).to eq(4)
		expect(@player.total_ties).to eq(2)
	end

end


