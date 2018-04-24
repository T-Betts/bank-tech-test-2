require 'datestamp'

class Transaction
  def initialize(type, amount, date = DateStamp.new.current_date)
    @type = type
    @amount = amount
    @date = date
  end

  attr_reader :amount, :date, :type
end
