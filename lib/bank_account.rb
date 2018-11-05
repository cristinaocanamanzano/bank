require 'date'

class BankAccount
  attr_reader :balance, :transactions

  def initialize
    @balance = 0
    @transactions = []
  end

  def add_deposit(amount)
    update_balance('deposit', amount)
    date = date_printer
    @transactions << {date: date, type: 'deposit', amount: amount, current_balance: @balance}
  end

  def add_withdrawal(amount)
    update_balance('withdrawal', amount)
    date = date_printer
    @transactions << {date: date, type: 'withdrawal', amount: amount, current_balance: @balance}
  end

  private

  def update_balance(type, amount)
    type === 'deposit' ? @balance += amount : @balance -= amount
  end

  def date_printer
    Date.today.strftime('%d/%m/%Y')
  end
end
