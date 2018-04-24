require_relative 'transaction.rb'

class Account
  def initialize(balance = 0)
    @balance = balance
    @account_history = []
  end

  def deposit(amount)
    @balance += amount
  end

  def withdraw(amount)
    @balance -= amount
  end

  attr_reader :balance, :account_history
end
