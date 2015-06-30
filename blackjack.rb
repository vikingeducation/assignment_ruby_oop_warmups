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

class Deck

  def initialize
    @deck = generate_deck

    @deck.shuffle!
  end

  def generate_deck
    deck = []

    suits = ["Hearts", "Clubs", "Spades", "Diamonds"]

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


class Blackjack

  def initialize
    @deck = Deck.new
    @bettor1 = Bettor.new
    @dealer = Dealer.new
    @players = [@bettor1, @dealer]
  end

  def deal_card_to_player(player)
    player.get_card(@deck.deal_card)
  end

  def play
    deal_initial_cards
    @players.each do |player|
      player.pretty_print
    end

  end

  def deal_initial_cards
    2.times do
      @players.each do |player|
        deal_card_to_player(player)
      end
    end
  end

end


class Player

  def initialize
    @hand = []
  end

  def hand
    @hand
  end

  def get_card(card)
    @hand << card
  end

  def pretty_print
    special_names = {1 => "Ace", 11 => "Jack", 12 => "Queen", 13 => "King"}
    current_hand = @hand

    current_hand = current_hand.sort{|x,y| y[:value] <=> x[:value]}

    puts "Your Cards:"

    current_hand.each do |card|
      if special_names[card[:value]]
        puts "#{special_names[card[:value]]} of #{card[:suit]}"
      else
        puts "#{card[:value]} of #{card[:suit]}"
      end
    end
  end

end


class Bettor < Player

end


class Dealer < Player

  def pretty_print

    special_names = {1 => "Ace", 11 => "Jack", 12 => "Queen", 13 => "King"}
    current_hand = @hand

    current_hand = current_hand.sort{|x,y| y[:value] <=> x[:value]}

    puts "Dealer's Cards:"

    1.times do
      if special_names[current_hand[0][:value]]
        puts "#{special_names[current_hand[0][:value]]} of #{current_hand[0][:suit]}"
      else
        puts "#{current_hand[0][:value]} of #{current_hand[0][:suit]}"
      end
    end

    puts "And an unknown card."
  end

end

blackjack = Blackjack.new

blackjack.play

























