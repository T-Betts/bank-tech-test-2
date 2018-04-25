require 'printer'

describe Printer do
  describe '#print_header' do
    it 'can print header' do
      expect { subject.print_header }.to output("date || credit || debit || balance\n").to_stdout
    end
  end

  describe '#print_all_transactions' do
    it 'can print a list of transactions' do
      expect { subject.print_all_transactions([['01-01-2018', 100, '-', 100], ['01-01-2018', '-', 27, 73]]) }.to output("01-01-2018 || - || 27 || 73\n01-01-2018 || 100 || - || 100\n").to_stdout
    end
  end
end
