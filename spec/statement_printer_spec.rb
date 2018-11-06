require './lib/statement_printer'

describe StatementPrinter do
  subject(:printer) { described_class.new }
  let(:account) do double :account, transactions: [{
      date: '03/10/2018',
      type: 'deposit',
      deposit: 200.0,
      withdrawal: ' ',
      current_balance: 200.00
    }, {
      date: '04/11/2018',
      type: 'withdrawal',
      deposit: ' ',
      withdrawal: 50.0,
      current_balance: 150.00
    }]
  end

  describe '#print_bank_statement' do
    it 'prints current bank statement in a user friendly way' do
      expect { printer.print_bank_statement(account) }.to output(
        "date || credit || debit || balance\n04/11/2018 ||   || 50.0 || 150.00\n03/10/2018 || 200.0 ||   || 200.00\n"
      ).to_stdout
    end
  end
end
