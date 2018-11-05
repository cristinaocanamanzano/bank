class StatementPrinter

  HEADING = "date || credit || debit || balance"

  def print_bank_statement(account)
    body = transactions_string(transactions_array(account))
    text_to_print = HEADING + "\n" + body
    puts text_to_print
  end

  private

  def transactions_array(account)
    account.transactions.reverse.map do |transaction|
      if transaction[:type] === 'deposit'
        "#{transaction[:date]} || #{transaction[:amount]} || || #{transaction[:current_balance]}"
      else
        "#{transaction[:date]} || || #{transaction[:amount]} || #{transaction[:current_balance]}"
      end
    end
  end

  def transactions_string(array)
    array.join("\n")
  end

end
