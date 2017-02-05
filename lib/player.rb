class Player
  def self.buy_in(bet)
    Player.new(100)
  end

  def initialize(bankroll)
    @bankroll = bankroll
    @current_bet = 0

  end

  attr_reader :bankroll
  attr_accessor :hand

  def deal_in(hand)
    @hand = hand
  end

  def take_bet(next_bet)
    raise "not enough money" if next_bet > @bankroll
    @bankroll = @bankroll - (next_bet - @current_bet)
    @current_bet += next_bet
    @current_bet
  end

  def receive_winnings(winnings)
    @bankroll += winnings

  end

  def return_cards
    # deck.return(@hand)
    card_arr = @hand.cards
    @hand = nil
    card_arr
  end

  def fold
    @folded = true
  end

  def unfold
    @folded = false
  end

  def folded?
    @folded

  end

end
