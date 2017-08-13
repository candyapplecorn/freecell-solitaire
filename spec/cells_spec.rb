require 'rspec'
require 'cells'

describe "cell" do
  subject('cell'){ Cell.new }
  let('card'){ double("card", :svalue => 0, :fvalue => 3) }


  context "Cell" do
    it "doesn't implement push" do
      expect{ cell.push(card) }.to raise_error
    end

    it "implements pop" do
      cell.insert(0, card)
      cell.pop
      expect(cell.count).to eq 0
    end
  end
end
describe "tableau" do
  subject('tableau') { Tableau.new }
  let('three'){ double('card') }
  let('four'){ double('card') }

  it "accepts any card when empty" do
    allow(three).to receive(:<).and_return(true)
    tableau.push(three)
    expect(tableau.count).to eq 1
  end

  it "does not accept an equal faced card" do
    allow(three).to receive(:<).and_return(false)
    tableau.push(three)
    tableau.push(four)
    expect(tableau.count).to eq 1
  end
end

describe "foundation" do
  subject('foundation'){ Foundation.new }
  let('ten'){ double('ten', :suite => :clubs) }

  context 'when empty' do
    it 'accepts any card' do
      expect(foundation.push(ten)).to be_truthy
    end
  end

  context 'when not empty' do
    let('jack'){ double('jack', :suite => :spades) }
    let('jack_hearts'){ double('jack', :suite => :hearts) }

    it 'rejects cards of same color' do
      allow(jack).to receive(:same_color).and_return(true)
      allow(jack).to receive(:>).and_return(true)
      foundation.push(ten)

      expect(foundation.push(jack)).to be false
      expect(foundation.count).to eq 1
    end

    it 'accepts a card of opposite color and next higher count' do
      allow(jack_hearts).to receive(:same_color).and_return(false)
      allow(jack_hearts).to receive(:>).and_return(true)
      foundation.push(ten)

      expect(foundation.push(jack_hearts)).to be_truthy
      expect(foundation.length).to eq 2
    end

    it 'rejects a card of opposite color and lesser count' do
      allow(ten).to receive(:same_color).and_return(false)
      allow(ten).to receive(:>).and_return(false)
      foundation.push(jack_hearts)

      expect(foundation.push(ten)).to be_falsey
      expect(foundation.length).to eq 1
    end
  end
end

describe "freecell" do
  subject('freecell'){ FreeCell.new }
  let('card'){ double("card", :svalue => 0, :fvalue => 3) }

  context 'push' do
    it 'accepts a card if empty' do
      expect{ freecell.push(card) }.not_to raise_error
    end

    it 'rejects a card if full' do
      freecell.push(card)
      expect(freecell.count).to eq 1
    end
  end
end

