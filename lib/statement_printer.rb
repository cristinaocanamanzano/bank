class StatementPrinter
  HEADING = 'date || credit || debit || balance'.freeze

  def print_bank_statement(account)
    body = transactions_string(transactions_array(account))
    text_to_print = HEADING + "\n" + body
    puts text_to_print
  end

  private

  def transactions_array(account)
    account.transactions.reverse.map do |trans|
      if trans[:type] == 'deposit'
        "#{trans[:date]} || #{trans[:amount]} || || #{trans[:current_balance]}"
      else
        "#{trans[:date]} || || #{trans[:amount]} || #{trans[:current_balance]}"
      end
    end
  end

  def transactions_string(array)
    array.join("\n")
  end
end
