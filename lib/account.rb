require_relative 'transaction.rb'
require_relative 'printer.rb'

class Account
  def initialize(balance = 0)
    @balance = balance
    @account_history = []
  end

  def deposit(amount, transaction = Transaction.new(amount))
    @balance += amount
    @account_history << [transaction.time, transaction.amount, '-', @balance]
  end

  def withdraw(amount, transaction = Transaction.new(amount))
    @balance -= amount
    @account_history << [transaction.time, '-', transaction.amount, @balance]
  end

  def show_statement(printer = Printer.new, account_history = @account_history)
    printer.print_header
    printer.print_all_transactions(account_history)
  end

  attr_reader :balance, :account_history
end
