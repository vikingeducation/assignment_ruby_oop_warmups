require './rock_paper_scissors.rb'

describe RockPaperScissors do
  before(:each) do
    @game = RockPaperScissors.new({single_player: true, num_rounds: 3})
  end

  describe "was initialized correctly" do
    it "has 3 rounds" do
      expect(@game.num_rounds).to eq(3)
    end

    it "has zero wins for player1" do
      expect(@game.player1_wins).to eq(0)
    end

    it "has zero wins for player2" do
      expect(@game.player2_wins).to eq(0)
    end

    it "initialized the computer correctly" do
      expect(@game.computer).to eq(true)
    end
  end

  describe "makes moves correctly" do
    it "ensures rock beats scissors" do
      expect(@game.make_move("R", "S")).to eq(-1)
    end

    it "ensures scissors beats paper" do
      expect(@game.make_move("S", "P")).to eq(-1)
    end

    it "ensures paper beats rock" do
      expect(@game.make_move("P", "R")).to eq(-1)
    end

    it "ensures player1 can win" do
      expect(@game.make_move("R", "S")).to eq(-1)
    end

    it "ensures player2 can win" do
      expect(@game.make_move("S", "R")).to eq(1)
    end

    it "ensures players can draw" do
      expect(@game.make_move("R", "R")).to eq(0)
    end
  end

  describe "plays through the game" do
    
  end
end
