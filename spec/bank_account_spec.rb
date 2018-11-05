require './lib/bank_account'

describe BankAccount do
  subject(:account) { described_class.new }

  describe '#initialize' do
    it 'initializes account with a total balance of 0' do
      expect(account.balance).to eq 0.00
    end
    it 'initializes account with an empty array of transactions' do
      expect(account.transactions).to eq []
    end
  end

  describe '#add_deposit' do
    it 'adds amount to balance' do
      account.add_deposit(200)
      expect(account.balance).to eq 200
    end

    it 'creates transaction with corresponding information' do
      Timecop.freeze(Time.parse('3 October 2018'))
      account.add_deposit(200)
      expect(account.transactions).to eq [{
        date: '03/10/2018',
        type: 'deposit',
        amount: 200,
        current_balance: 200
      }]
    end
  end

  describe '#add_withdrawal' do
    before do
      Timecop.freeze(Time.parse('3 October 2018'))
      account.add_deposit(200)
      Timecop.freeze(Time.parse('4 November 2018'))
      account.add_withdrawal(50)
    end

    it 'removes amount from balance' do
      expect(account.balance).to eq 150
    end

    it 'creates transaction with corresponding information' do
      expect(account.transactions).to eq [{
        date: '03/10/2018',
        type: 'deposit',
        amount: 200,
        current_balance: 200
      }, {
        date: '04/11/2018',
        type: 'withdrawal',
        amount: 50,
        current_balance: 150
      }]
    end
  end
end
