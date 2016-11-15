require 'oystercard'

describe OysterCard do
  subject(:oyster) {OysterCard.new}

  it "should have a balance" do
    expect(oyster.balance).to eq 0
  end
end
