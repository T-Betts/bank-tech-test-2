require 'transaction'

describe Transaction do
  describe '#new' do
    it 'is instantiated with a date' do
      trn = Transaction.new('deposit', '10-05-2018')
      expect(trn.date).to eq '10-05-2018'
    end

    it 'is instantiated with a type' do
      trn = Transaction.new('deposit', '10-05-2018')
      expect(trn.type).to eq 'deposit'
    end
  end
end
