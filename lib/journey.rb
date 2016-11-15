require 'oystercard'
require 'station'

class Journey

  attr_reader :entry_station, :exit_station

  def initialize(entry_station, exit_station)
    @entry_station = entry_station
    @exit_station = exit_station
  end

  def fare
    if incomplete_journey? then
      PENALTY_FARE
    else
      MINIMUM_FARE
    end
  end

  private

  PENALTY_FARE = 6
  MINIMUM_FARE = OysterCard::MINIMUM_BALANCE
  
  def incomplete_journey?
    entry_station.nil? || exit_station.nil?
  end
end
