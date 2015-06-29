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