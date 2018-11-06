class StatementPrinter
  HEADING = 'date || credit || debit || balance'

  def print_bank_statement(account)
    body = transactions_string(transactions_array(account))
    text_to_print = HEADING + "\n" + body
    puts text_to_print
  end

  private

  def transactions_array(account)
    transactions = account.transactions.reverse
    transactions.map do |trans|
        "#{trans[:date]} || #{trans[:deposit]} || #{trans[:withdrawal]} || #{trans[:current_balance]}"
    end
  end

  def transactions_string(array)
    array.join("\n")
  end

end
