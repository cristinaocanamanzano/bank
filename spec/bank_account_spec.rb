require './lib/bank_account'

describe BankAccount do
  subject(:account) { described_class.new }

  describe '#initialize' do
    it 'initializes account with a total balance of 0' do
      expect(account.balance).to eq 0
    end
    it 'initializes account with an empty array of transactions' do
      expect(account.transactions).to eq []
    end
  end
end
