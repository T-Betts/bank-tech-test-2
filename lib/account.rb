require 'transaction'

class Account
  def initialize(balance = 0)
    @balance = balance
  end

  attr_reader :balance
end
