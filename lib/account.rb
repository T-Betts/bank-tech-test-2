require_relative 'transaction.rb'

class Account
  def initialize(balance = 0)
    @balance = balance
    @account_history = []
  end

  def deposit(amount, transaction = Transaction)
    @balance += amount
    @account_history << [transaction.new('deposit', amount), @balance]
  end

  def withdraw(amount, transaction = Transaction)
    @balance -= amount
    @account_history << [transaction.new('withdrawal', amount), @balance]
  end

  def show_statement
    puts 'date || credit || debit || balance'
    @account_history.each do |transaction|
      if transaction[0].type == 'deposit'
        puts "#{transaction[0].date} || #{transaction[0].amount} || - || #{transaction[1]}"
      else
        puts "#{transaction[0].date} || - || #{transaction[0].amount} || #{transaction[1]}"
      end
    end
  end

  attr_reader :balance, :account_history
end
