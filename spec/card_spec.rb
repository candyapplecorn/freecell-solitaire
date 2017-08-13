require 'rspec'
require 'card.rb'

describe "Card" do 
  subject("card") { Card.new(0, 0) }
  let("spades") { Card.new(0, 0) }
  let("clubs") { Card.new(1, 0) }
  let("diamonds") { Card.new(2, 0) }
  let("hearts") { Card.new(3, 0) }
  let("jack") { Card.new(0, 11) }
  let("ten") { Card.new(3, 10) }

  context "when creating cards" do
    it "creates an ace" do
      expect(card.face).to eq :ace
    end

    it "creates an ace of hearts" do
      expect(hearts.suite.to_s).to match(/heart/)
    end

    it "creates an ace of diamonds" do
      expect(diamonds.suite.to_s).to match(/diamond/)
    end

    it "creates an ace of clubs" do
      expect(clubs.suite.to_s).to match(/club/)
    end

    it "creates an ace of spades" do
      expect(spades.suite.to_s).to match(/spade/)
    end
  end
  context "when comparing cards" do
    it "doesn't categorize a same face value as higher or lower" do
      expect(spades.is_after? clubs).to be_falsey
    end

    it "categorizes a jack as higher than a ten" do
      expect(jack.is_after?(ten)).to be_truthy
    end

    it "categorizes a ten as lower than a jack" do
      expect(ten.is_before?(jack)).to be_truthy
    end

    it "implements the > operator" do
      expect(jack > ten).to be_truthy
    end

    it "implements the < operator" do
      expect(ten < jack).to be_truthy
    end

    it "categorizes cards as same color" do
      expect(spades.same_color clubs).to be_truthy
      expect(hearts.same_color diamonds).to be_truthy
    end

    it "categorizes cards as different colors" do
      expect(hearts.same_color clubs).to be_falsey
      expect(hearts.same_color spades).to be_falsey
    end

    it "properly matches suites" do
      two_of_hearts = Card.new(3, 1)

      expect(hearts.same_suite two_of_hearts).to eq true
      expect(hearts.same_suite spades).to eq false
    end
  end
end
