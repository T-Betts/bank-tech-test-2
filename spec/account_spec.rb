require 'account'

describe Account do
  # let(:Transaction_class_double) { double('Transaction_class_double', new: :deposit_transaction) }
  let(:deposit_transaction)         { double('deposit transaction', type: 'deposit', amount: 100, date: '01-01-2018') }
  let(:withdrawal_transaction)      { double('withdrawal transaction', type: 'withdrawal', amount: 27, date: '01-01-2018') }

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
      @acc.deposit(100, deposit_transaction)
      expect(@acc.balance).to eq 100
    end

    it 'logs deposit in the account history' do
      @acc.deposit(100, deposit_transaction)
      expect(@acc.account_history[0][0].amount).to eq 100
    end
  end

  describe '#withdraw' do
    it 'can withdraw funds from account' do
      @acc.deposit(100, deposit_transaction)
      @acc.withdraw(27, withdrawal_transaction)
      expect(@acc.balance).to eq 73
    end

    it 'logs withdrawal in the account history' do
      @acc.deposit(100, deposit_transaction)
      @acc.withdraw(27, withdrawal_transaction)
      expect(@acc.account_history[1][0].amount).to eq 27
    end
  end

  describe '#show_statement' do
    it 'can show account transaction history in correct format' do
      account = Account.new
      account.deposit(100, deposit_transaction)
      account.withdraw(27, withdrawal_transaction)
      expect { account.show_statement }.to output("date || credit || debit || balance\n01-01-2018 || - || 27 || 73\n01-01-2018 || 100 || - || 100\n").to_stdout
    end
  end
end
