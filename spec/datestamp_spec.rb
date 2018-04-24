require 'datestamp'

describe DateStamp do
  describe '#current_date' do
    it 'returns the current date' do
      expect(DateStamp.new.current_date).to eq Date.today.strftime('%d-%m-%Y')
    end
  end
end
