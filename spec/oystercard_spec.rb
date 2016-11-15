require 'oystercard'

describe OysterCard do
  subject(:oyster) {OysterCard.new}

  it "should have a balance" do
    expect(oyster.balance).to eq 0
  end

  it "should top up money" do
    oyster.top_up(50)
    expect(oyster.balance).to eq 50
  end

  it "should fail if trying to top up beyond limit" do
    oyster.top_up(80)
    expect{oyster.top_up(20)}.to raise_error "£90 limit breached"
  end
end
