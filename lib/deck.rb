require 'card'
require 'hand'
class Deck
  def initialize(cards = Deck.all_cards)
    @cards = cards
  end

  attr_reader

  def self.all_cards
    cards = []
    Card::SUITS::product(Card::VALUES.keys) do |suit, value|
      cards << Card.new(suit, value)
    end
    cards
  end

  def count
    @cards.length
  end

  def take(n)
    if n <= @cards.length
      taken = @cards[0...n]
      @cards = @cards - taken
      taken
    else
      raise "not enough cards"
    end
    taken
  end

  def return(array)
    @cards.concat(array)
  end

  def shuffle
    @cards.shuffle!
  end

  def deal_hand
    five = take(5)
    Hand.new(five)

  end
end
