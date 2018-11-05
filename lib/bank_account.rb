require 'date'

class BankAccount
  attr_reader :balance, :transactions

  def initialize
    @balance = 0
    @transactions = []
  end

  def add_deposit(amount)
    @date = date_printer
    @balance += amount
    @transactions << {date: @date, type: 'deposit', amount: amount, current_balance: @balance}
  end

  def add_withdrawal(amount)
    @date = date_printer
    @balance -= amount
    @transactions << {date: @date, type: 'withdrawal', amount: amount, current_balance: @balance}
  end

  private

  def date_printer
    Date.today.strftime('%d/%m/%Y')
  end
end
