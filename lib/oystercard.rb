class OysterCard

  attr_reader :balance, :entry_station, :journey_history

  LIMIT = 90
  MINIMUM_BALANCE = 1

  def initialize
    @balance = 0
    @journey_history = []
  end

  def top_up(money)
    fail "£#{LIMIT} limit breached" if limit_breach?(money)
    @balance += money
  end

  def in_journey?
    !@entry_station.nil?
  end

  def touch_in(station)
    fail "less than minimum balance(£#{MINIMUM_BALANCE})" if under_minimum_balance?
    @entry_station = station.name
  end

  def touch_out(station)
    deduct(MINIMUM_BALANCE)
    @journey_history.push [entry_station, station.name]
    @entry_station = nil
  end


  private

  def limit_breach?(money)
    balance + money > LIMIT
  end

  def under_minimum_balance?
    balance < MINIMUM_BALANCE
  end

  def deduct(money)
    @balance -= money
  end

end
