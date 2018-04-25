require 'transaction'

describe Transaction do
  describe '#new' do
    before(:each) do
      @trn = Transaction.new(50, '10-05-2018')
    end

    it 'is instantiated with a date' do
      expect(@trn.time).to eq '10-05-2018'
    end

    it 'is instantiated with an amount' do
      expect(@trn.amount).to eq 50
    end
  end
end
