require 'transaction'

class Account
  def initialize(balance = 0)
    @balance = balance
    @account_history = []
  end

  def deposit(amount)
    @balance += amount
  end

  attr_reader :balance, :account_history
end
