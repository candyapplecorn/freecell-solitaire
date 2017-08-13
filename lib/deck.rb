require_relative 'card'

class Deck
  attr_accessor :cards

  def initialize
    @cards = self.class.new_deck
  end

  def take(amount = 1)
    Array.new(amount) { @cards.pop }
  end

  def shuffle!
    @cards.shuffle! {|a, b| a.face <=> b.face}
  end

  def self.new_deck
    suites = [0, 1, 2, 3]
    faces = (0..12).to_a

    suites.product(faces).map do |sf|
      Card.new(sf.first, sf.last)
    end
  end
end
