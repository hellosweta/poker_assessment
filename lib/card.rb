class Card


  SUIT_STRINGS = {
    :clubs    => "♣",
    :diamonds => "♦",
    :hearts   => "♥",
    :spades   => "♠"
  }

  VALUE_STRINGS = {
    :two   => "2",
    :three => "3",
    :four  => "4",
    :five  => "5",
    :six   => "6",
    :seven => "7",
    :eight => "8",
    :nine  => "9",
    :ten   => "10",
    :jack  => "J",
    :queen => "Q",
    :king  => "K",
    :ace   => "A"
  }

 SUITS = [
   :hearts,
   :spades,

   :clubs,
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

  def self.suits
   SUIT_STRINGS.keys
 end

 def self.royal_values
   VALUE_STRINGS.keys[-5..-1]
 end

 def self.values
   VALUE_STRINGS.keys
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


  def self.royal_values
   VALUE_STRINGS.keys[-5..-1]
  end

  def <=>(other_card)
    if self == other_card
      0
    elsif value != other_card.value
      Card.values.index(value) <=> Card.values.index(other_card.value)
    elsif suit != other_card.suit
      Card.suits.index(suit) <=> Card.suits.index(other_card.suit)
    end
  end

end
