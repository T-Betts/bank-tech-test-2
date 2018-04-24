require 'account'

describe Account do
  before(:each) do
    @acc = Account.new
  end

  describe '#new' do
    it 'is instantiated with a balance of 0' do
      expect(@acc.balance).to eq 0
    end

    it 'is instantiated with an blank account history' do
      expect(@acc.account_history).to eq []
    end
  end

  describe '#deposit' do
    it 'can deposit funds into account' do
      @acc.deposit(100)
      expect(@acc.balance).to eq 100
    end
  end

  describe '#withdraw' do
    it 'can withdraw funds from account' do
      @acc.deposit(100)
      @acc.withdraw(27)
      expect(@acc.balance).to eq 73
    end
  end

  describe '#show_statement' do
    account = Account.new
    account.deposit(100)
    account.withdraw(42)
    specify { expect { account.show_statement }.to output("date || credit || debit || balance\n#{Date.today.strftime('%d-%m-%Y')} || 100 || - || 100\n#{Date.today.strftime('%d-%m-%Y')} || - || 42 || 58\n").to_stdout }
  end
end
