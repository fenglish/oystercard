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

  it "should deduct money for journey" do
    oyster.top_up(50)
    oyster.deduct(20)
    expect(oyster.balance).to eq 30
  end

  it "should start not in a journey" do
    expect(oyster).not_to be_in_journey
  end

  it "should touch in" do
    oyster.top_up(1)
    oyster.touch_in
    expect(oyster).to be_in_journey
  end

  it "should touch out too" do
    oyster.top_up(1)
    oyster.touch_in
    oyster.touch_out
    expect(oyster).not_to be_in_journey
  end

  it "should fail when money is less than £1" do
    expect{oyster.touch_in}.to raise_error "less than minimum balance(£1)"
  end

end
