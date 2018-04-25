require_relative 'transaction.rb'

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

  def show_statement
    print_header
    print_all_transactions
  end

  def print_header
    puts 'date || credit || debit || balance'
  end

  def print_all_transactions
    @account_history.reverse.each do |transaction|
      puts transaction.join(' || ')
    end
  end

  attr_reader :balance, :account_history
end
