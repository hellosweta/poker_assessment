class Card

 SUITS = [
   :hearts,
   :spades,

   :clovers,
   :diamonds
 ]

 VALUES = {

   :two => 2,
   :three => 3,
   :four => 4,
    :five => 5,
   :six => 6,
  :seven => 7,
   :eight => 8,
   :nine => 9,
    :ten => 10,
   :jack => 11,
   :queen => 12,
   :king => 13,
   :ace => 14,
 }


  attr_reader :value, :suit

  def initialize(suit, value)
    if SUITS.include?(suit)
      @suit = suit
    else
      raise "invalid suit"
    end

    @suit = suit
    if VALUES.keys.include?(value)
      @value = value
    else
      raise "invalid value"
    end
  end

  def values


  end

  def <=>(another_card)
    if value == another_card.value && suit == another_card.suit
      return 0
    elsif value == another_card.value
      SUITS.index(self.suit) <=> SUITS.index(another_card.suit)
    else
      VALUES[value] <=> VALUES[another_card.value]
    end
  end

end
