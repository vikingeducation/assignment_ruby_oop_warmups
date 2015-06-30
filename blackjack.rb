
class Deck

  def new_deck

    vals = ["A", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K"]
    suits = ["H", "S", "C", "D"]

    @deck = []

    vals.each do |v|
      suits.each do |s|
        @deck << v + s

      end

    end

  end


  def shuffle_deck

    @deck = @deck.shuffle

  end


  def show_deck

    print @deck
    print "\n"

  end

  def get_card

    @deck.pop

  end


end

class Hand

  initialize (card)
  
    @hand = 

  end




end


class Game

  def initialize
    @current_hand = []

  end

  def deal

    2.times do 
      current_hand << deck.get_card
    end
    

  end

end


class Player



end


deck = Deck.new
deck.new_deck
deck.shuffle_deck
deck.show_deck

