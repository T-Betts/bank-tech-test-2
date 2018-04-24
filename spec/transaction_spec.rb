require 'transaction'

describe Transaction do
  describe '#new' do
    it 'can be instantsiated with a date' do
      trn = Transaction.new('10-05-2018')
      expect(trn.date).to eq '10-05-2018'
    end
  end
end
