class Printer
  def print_header
    puts 'date || credit || debit || balance'
  end

  def print_all_transactions(account_history)
    account_history.reverse.each do |transaction|
      puts transaction.join(' || ')
    end
  end
end
