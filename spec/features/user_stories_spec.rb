require './lib/bank_account'

describe 'User stories' do
  it 'so that they can add money to their account, user can add a deposit' do
    account = BankAccount.new
    expect { account.add_deposit(200) }.not_to raise_error
  end

  it 'so that they can take money from their account, user can make a withdrawal' do
    account = BankAccount.new
    expect { account.add_withdrawal(100) }.not_to raise_error
  end

  it 'so that they can check their transactions, user can see their bank statement' do
    account = BankAccount.new
    printer = StatementPrinter.new
    account.add_deposit(200)
    account.add_withdrawal(100)
    expect { printer.print_bank_statement(account) }.not_to raise_error
  end
end
