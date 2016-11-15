require "journey_log"

describe JourneyLog do
  subject(:journey_log) { JourneyLog.new(Journey) }
  let(:station){ double :station, name: :aldgate_east, zone: 1 }

  it { is_expected.to respond_to :start }

  it "should start a new journey when given a station" do
    expect(journey_log.start(station)).to be_instance_of(Journey)
  end


end
