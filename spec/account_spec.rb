require 'account'

describe Account do
  describe '#new' do
    it 'is instantiated with a balance of 0' do
      acc = Account.new
      expect(acc.balance).to eq 0
    end

    it 'is instantiated with an blank account history' do
      acc = Account.new
      expect(acc.account_history).to eq []
    end
  end
end
