require 'oystercard'

describe OysterCard do
  subject(:oyster) {OysterCard.new}
      let(:station1){double :station, name: :aldgate_east}
      let(:station2){double :station, name: :liverpool_street}

  it "should have a balance" do
    expect(oyster.balance).to eq 0
  end

  it "should top up money" do
    oyster.top_up(50)
    expect(oyster.balance).to eq 50
  end

  it "should fail if trying to top up beyond limit" do
    oyster.top_up(80)
    expect{oyster.top_up(20)}.to raise_error "£#{OysterCard::LIMIT} limit breached"
  end


  it "should start not in a journey" do
    expect(oyster).not_to be_in_journey
  end

  it "should touch in" do
    oyster.top_up(1)
    oyster.touch_in(station1)
    expect(oyster).to be_in_journey
  end

  it "should touch out too" do
    oyster.top_up(1)
    oyster.touch_in(station1)
    oyster.touch_out(station2)
    expect(oyster).not_to be_in_journey
  end

  it "should fail when money is less than £1" do
    expect{oyster.touch_in(station1)}.to raise_error "less than minimum balance(£1)"
  end

  it "should deduct money on touching out" do
    oyster.top_up 50
    expect{oyster.touch_out(station2)}.to change{oyster.balance}.by -1 * OysterCard::MINIMUM_BALANCE
  end

  it "should save entry station on touching in" do
    oyster.top_up(1)
    oyster.touch_in(station1)
    expect(oyster.entry_station).to eq station1.name
  end

  it "should return nil when touch_out at station" do
    oyster.top_up(1)
    oyster.touch_in(station1)
    oyster.touch_out(station2)
    expect(oyster.entry_station).to eq nil
  end

  it "should start with an empty hash of journeys" do
    expect(oyster.journey_history).to eq []
  end

  it "should store one journey after a journey is completed" do
    oyster.top_up(1)
    oyster.touch_in(station1)
    oyster.touch_out(station2)
    journey = [:aldgate_east, :liverpool_street]
    expect(oyster.journey_history).to eq [journey]
  end

end
