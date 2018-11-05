class BankAccount
  attr_reader :balance, :transactions

  def initialize
    @balance = 0
    @transactions = []
  end

  def add_deposit(amount)
    @balance += amount
  end
end
