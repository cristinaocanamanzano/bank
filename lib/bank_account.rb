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
    add_transaction('deposit', amount)
  end

  def add_withdrawal(amount)
    update_balance('withdrawal', amount)
    add_transaction('withdrawal', amount)
  end

  private

  def update_balance(type, amount)
    type == 'deposit' ? @balance += amount : @balance -= amount
  end

  def date_printer
    Date.today.strftime('%d/%m/%Y')
  end

  def add_transaction(type, amount)
    @transactions << {
      date: date_printer,
      type: type,
      amount: amount,
      current_balance: @balance
    }
  end
end
