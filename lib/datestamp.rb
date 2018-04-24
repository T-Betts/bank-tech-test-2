require 'date'

class DateStamp
  def current_date
    Date.today.strftime('%d-%m-%Y')
  end
end
