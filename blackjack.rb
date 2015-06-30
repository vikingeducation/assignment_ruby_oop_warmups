=begin

class Blackjack
  - Has at least 2 players
  - Has at least 1 dealer, 1 bettor
  - Has only 1 deck
  - Individually allows each player to play

module Card
  - Has values for each card

class Deck
  - Has many cards
  - Can shuffle
  - Can deal

class Hand
  - Has many cards
  - Starts with 0 cards
  - Dealt cards
  - Can calculate score

class Player
  - Hit or pass
  - Has money
  - Has Hand

class Bettor < Player

class Dealer < Player
  - Goes last.
  - 1st card shown.
  - Predefined actions.

=end


deck = []

suits = ["hearts", "clubs", "spades", "diamonds"]

values = (1..13).to_a

# 52.times do |i|

  
#   deck[(i+1)] = (i%13 + 1).to_s
  
#   end

# p deck

# 52.times do |i|

#   if deck[%4] == 0
#     deck[i] += suits[]

# [
#   {suit: hearts, value: ace},
#   {suit: hearts, value: two}
# ]



# p deck.select{|card| card[:value] == 1}.length
# p deck.select{|card| card[:suit] == "hearts"}.length
# p deck.select{|card| card[:suit] == "spades"}.length
# p deck.select{|card| card[:suit] == "clubs"}.length

p deck.shuffle!


class Deck

  def initialize
    @deck = generate_deck

    @deck.shuffle!
  end

  def generate_deck
    deck = []

    suits = ["hearts", "clubs", "spades", "diamonds"]

    values = (1..13).to_a

    52.times do |i|
      deck << {suit: suits[i%4], value: values[i%13]} 
    end

    return deck
  end

  def deal_card

    @deck.pop

  end

end

class Hand

  def initialize

    @hand = []

  end

  def get_card(card)

    @hand.push(card)

  end

end


class Blackjack

  def initialize
    @deck = Deck.new
    @player1 = Bettor.new
    @dealer = Dealer.new
  end

end


class Player



  def initialize
    @hand = Hand.new
  end

  def hand

    @hand
    
  end

end


class Bettor < Player

end


class Dealer < Player

end



























