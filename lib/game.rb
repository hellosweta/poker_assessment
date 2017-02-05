require_relative 'deck.rb'
require_relative  'player.rb'

class Game

  def initialize
    @pot = 0
    @deck = Deck.new
  end
  attr_reader :deck, :pot, :players
  def add_players(number, bankrolls)
    @players = []
    number.times do |x|
      @players << Player.new(bankrolls)
    end
    @players
  end

  def game_over?
    player_count = 0
    @players.each do |player|
      player_count += 1 if player.bankroll > 0
    end
    player_count < 2
  end

  def deal_cards
    @players.each do |player|
      player.hand = @deck.deal_hand if player.bankroll > 0
    end
  end

  def add_to_pot(amt)
    @pot += amt

  end
end
