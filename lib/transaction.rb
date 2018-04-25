require 'time'

class Transaction
  def initialize(amount, time = Time.new.strftime('%d-%m-%Y'))
    @amount = amount
    @time = time
  end

  attr_reader :amount, :time
end
