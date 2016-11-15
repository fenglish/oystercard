require "journey_log"

describe JourneyLog do
  subject(:journey_log) { JourneyLog.new(Journey) }
  let(:station){ double :station, name: :aldgate_east, zone: 1 }
  let(:second_station){ double :station, name: :whitechapel, zone: 2 }

  it { is_expected.to respond_to :start }

  it "should start a new journey when given a station" do
    expect(journey_log.start(station)).to be_instance_of(Journey)
  end

  it "should store journeys" do
    expect(journey_log.journeys).to be_instance_of Array
  end

  it "should add a new journey to the list" do
    first_journey = journey_log.start(station)
    expect(journey_log.journeys.size).to eq 1
    expect(journey_log.journeys[0]).to eq first_journey
  end

  it "should have a current_journey method that returns an incomplete journey" do
    journey_log.start(station)
    expect(journey_log.current_journey).to be_instance_of Journey
  end

  it "should create a new journey if it is a complete journey" do
    journey_log.start(station)
    journey_log.finish(second_station)
    new_journey = journey_log.current_journey
    expect(journey_log.journeys[1]).to eq new_journey
  end

  it { is_expected.to respond_to :finish }

  it "should finish journey on current_journey when given another station" do
    journey_log.start(station)
    journey_log.finish(second_station)
    expect(journey_log.journeys[-1]).not_to be_incomplete_journey
  end

end
