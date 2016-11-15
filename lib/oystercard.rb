class OysterCard

  attr_reader :balance

  LIMIT = 90
  MINIMUM_BALANCE = 1

  def initialize
    @balance = 0
    @in_journey = false
  end

  def top_up(money)
    fail "£#{LIMIT} limit breached" if limit_breach?(money)
    @balance += money
  end

  def deduct(money)
    @balance -= money
  end

  def in_journey?
    @in_journey
  end

  def touch_in
    fail "less than minimum balance(£1)" if under_minimum_balance?
    @in_journey = true
  end

  def touch_out
    @in_journey = false
  end
  private
  def limit_breach?(money)
    balance + money > LIMIT
  end

  def under_minimum_balance?
    balance < MINIMUM_BALANCE
  end

end
