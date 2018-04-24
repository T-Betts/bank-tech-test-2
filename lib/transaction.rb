require 'datestamp'

class Transaction
  def initialize(date = DateStamp.new.current_date)
    @date = date
  end

  attr_reader :date
end
