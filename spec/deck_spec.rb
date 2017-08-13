require 'rspec'
require 'deck'
require 'byebug'

describe "deck" do
  subject("deck"){ Deck.new }

  context "Upon creating a new deck:" do
    it "Creates a new 52 card deck" do
      expect(deck.cards.length).to eq 52
    end

    it "Has four kings" do
      num_kings = deck.cards.select{|c| c.face == :king}.count
      expect(num_kings).to eq 4
    end

    it "has 13 of each suite" do
      Card::SUITES.each do |suite|
        expect(deck.cards.select{|c| c.suite == suite}.count).to eq(13)
      end
    end
  end

  it "shuffles the deck" do
    faces = deck.cards.map(&:face)
    deck.shuffle!
    other_faces = deck.cards.map(&:face)
    expect(faces).not_to eq(other_faces)
  end

  context "#take" do
    let("cards"){ deck.take(8) }

    it "offers cards from the deck" do
      expect(cards.first).to be_an_instance_of Card
    end

    it "subtracts the card from its cards" do
      expect(deck.cards.length - cards.length).to eq 44
    end
  end
end
