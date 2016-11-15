class JourneyLog

  attr_reader :journeys

  def initialize(journey_class)
    @journey_class = journey_class
    @journeys = []
  end

  def start(station)
    @journeys << @journey_class.new(station, nil)
    return @journeys[-1]
  end

  def current_journey
    @journeys[-1] if @journeys[-1].incomplete_journey?
  end
end
