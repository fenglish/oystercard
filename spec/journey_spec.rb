require 'journey'

describe Journey do
  let(:first_station){double :station, name: :aldgate_east, zone: 1}
  let(:second_station){double :station, name: :liverpool_street, zone: 1}
  subject(:journey){ Journey.new(first_station, second_station) }

  it { is_expected.to respond_to :entry_station }
  it { is_expected.to respond_to :exit_station }
  it { is_expected.to respond_to :fare }

  it "should be created with station information" do
    expect(journey.entry_station).to eq first_station
    expect(journey.exit_station).to eq second_station
  end

  it "should be able to calculate fares for nil station" do
    journey = Journey.new(nil, second_station)

    expect(journey.fare).to eq 6
  end

  it "should return the minimum fare in normal circumstances" do
    expect(journey.fare).to eq 1
  end

  it { is_expected.to respond_to :finish }

  it "should return exit_station when finished the journey" do
    journey = Journey.new(first_station, nil)
    journey.finish(second_station)
    expect(journey.exit_station).to eq second_station
  end

end
