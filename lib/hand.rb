require_relative 'card'
require_relative 'poker_hands'
class Hand

  include PokerHands

  def initialize(cards)
    raise "must have five cards" if cards.length != 5
    @cards = cards
  end

  attr_accessor :cards

  RANKS = [
    :royal_flush,
    :straight_flush,
    :four_of_a_kind,
    :full_house,
    :flush,
    :straight,
    :three_of_a_kind,
    :two_pair,
    :one_pair,
    :high_card
  ]

  def trade_cards(take_cards, new_cards)
    raise "must have five cards" if take_cards.length != new_cards.length
    unless take_cards.all? { |card| @cards.include?(card) }
      raise "cannot discard unowned card"
    end
    @cards -= take_cards
    @cards += new_cards
  end
  #
  # def rank
  #   RANKS.each do |rank|
  #     return rank if self.send("#{rank}?")
  #   end
  # end
  #
  # def <=>(other_hand)
  #   if self == other_hand
  #     0
  #   elsif RANKS.index(self.rank) < RANKS.index(other_hand.rank)
  #     return 1
  #   elsif RANKS.index(self.rank) > RANKS.index(other_hand.rank)
  #     return -1
  #   else
  #     tie_breaker(other_hand)
  #   end
  # end

  def self.winner(hands)
    winning_hand = hands[0]
    hands.each do |hand|
      if (winning_hand <=> hand) == 1

        winning_hand = hand
      end
    end
    winning_hand
  end
end
