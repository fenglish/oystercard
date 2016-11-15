require_relative "journey.rb"

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
    return @journeys[-1] if @journeys[-1].incomplete_journey?
    start(nil)
  end

  def finish(station)
    current_journey.finish(station)
  end

end
