class JourneyLog

  def initialize(journey_class)
    @journey_class = journey_class
  end

  def start(station)
    @journey_class.new(station, nil)
  end

end
