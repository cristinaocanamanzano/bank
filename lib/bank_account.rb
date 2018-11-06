require 'date'
require_relative 'statement_printer'

class BankAccount
  attr_reader :balance, :transactions

  def initialize
    @balance = 0.00
    @transactions = []
  end

  def add_deposit(amount)
    update_balance('deposit', amount)
    add_transaction('deposit', two_decimals(amount), ' ')
  end

  def add_withdrawal(amount)
    update_balance('withdrawal', amount)
    add_transaction('withdrawal', ' ', two_decimals(amount))
  end

  private

  def update_balance(type, amount)
    type == 'deposit' ? @balance += amount : @balance -= amount
  end

  def add_transaction(type, deposit, withdrawal)
    @transactions << {
      date: date_printer,
      type: type,
      deposit: deposit,
      withdrawal: withdrawal,
      current_balance: two_decimals(@balance)
    }
  end

  def date_printer
    Date.today.strftime('%d/%m/%Y')
  end

  def two_decimals(amount)
    sprintf('%.2f',amount)
  end

end
