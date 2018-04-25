require 'account'

describe Account do
  let(:dep_double) { double('deposit', amount: 100, time: '01-01-2018') }
  let(:withd_double) { double('withdrawal', amount: 27, time: '01-01-2018') }
  let(:printer_double) { double('printer', print_header: (print "date || credit || debit || balance\n"), print_all_transactions: (print "01-01-2018 || - || 27 || 73\n01-01-2018 || 100 || - || 100\n")) }

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
      @acc.deposit(100, dep_double)
      expect(@acc.balance).to eq 100
    end

    it 'logs deposit in the account history' do
      @acc.deposit(100, dep_double)
      expect(@acc.account_history[0][1]).to eq 100
    end
  end

  describe '#withdraw' do
    it 'can withdraw funds from account' do
      @acc.deposit(100, dep_double)
      @acc.withdraw(27, withd_double)
      expect(@acc.balance).to eq 73
    end

    it 'logs withdrawal in the account history' do
      @acc.deposit(100, dep_double)
      @acc.withdraw(27, withd_double)
      expect(@acc.account_history[1][2]).to eq 27
    end
  end

  describe '#show_statement' do
    it 'can show account transaction history in correct format' do
      account = Account.new
      account.deposit(100, dep_double)
      account.withdraw(27, withd_double)
      expect { account.show_statement(printer_double) }.to output("date || credit || debit || balance\n01-01-2018 || - || 27 || 73\n01-01-2018 || 100 || - || 100\n").to_stdout
    end
  end
end
