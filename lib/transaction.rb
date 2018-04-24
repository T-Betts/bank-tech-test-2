require 'datestamp'

class Transaction
  def initialize(type, date = DateStamp.new.current_date)
    @date = date
    @type = type
  end

  attr_reader :date, :type
end
