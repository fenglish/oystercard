class OysterCard

  attr_reader :balance

  LIMIT = 90

  def initialize
    @balance = 0
  end

  def top_up(money)
    fail "£#{LIMIT} limit breached" if limit_breach?(money)
    @balance += money
  end

  def deduct(money)
    @balance -= money
  end

  private
  def limit_breach?(money)
    @balance+money > LIMIT
  end
end
