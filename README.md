# Bank Tech Test

This is my proposal for the Bank Tech Test at Makers Academy (week 10).

Setup
-------
1. Download this repository
2. Run 'bundle' in the command line to make sure all gems are installed
3. Navigate to this repository folder
4. Run 'irb'
5. Require the file 'bank account' (in the lib folder)
4. Use the program (check feature test below to see an example)

How to run the tests
-------
1. Download this repository
2. Run 'bundle'
3. Navigate to this repository folder
4. Run 'rspec'

What is this challenge about?
-------

This challenge consists of a small program that allows you to:

- Add deposits to your bank account
- Add withdrawals to your bank account
- Print a statement where you can check all your transactions.

Approach
-------
To solve this challenge, two different classes have been created:

- A BankAccount class, which is responsible for managing the data about the current balance and all transactions made in the account
- A StatementPrinter class, which is responsible for printing the account transaction details based on the information contained in the bank account


Specifications
-------

Full instructions can be found [here](https://github.com/makersacademy/course/blob/master/individual_challenges/bank_tech_test.md).

User Stories
-------

```
As a user
So that I can add money to my bank account,
I would like to be able to add deposits to my bank account

As a user
So that I can take money from my bank account,
I would like to be able to withdraw money from my bank account

As a user
So that I can check all my bank transactions,
I would like to be able to see my bank statement printed on the screen
```

Feature test
-----
```
2.5.1 :001 > require './lib/bank_account.rb'
 => true
2.5.1 :002 > account = BankAccount.new
 => #<BankAccount:0x00007faeff81df98 @balance=0.0, @transactions=[]>
2.5.1 :003 > account.add_deposit(200)
 => [{:date=>"06/11/2018", :type=>"deposit", :deposit=>"200.00", :withdrawal=>" ", :current_balance=>"200.00"}]
2.5.1 :004 > account.add_withdrawal(50)
 => [{:date=>"06/11/2018", :type=>"deposit", :deposit=>"200.00", :withdrawal=>" ", :current_balance=>"200.00"}, {:date=>"06/11/2018", :type=>"withdrawal", :deposit=>" ", :withdrawal=>"50.00", :current_balance=>"150.00"}]
2.5.1 :005 > printer = StatementPrinter.new
 => #<StatementPrinter:0x00007faeff124700>
2.5.1 :006 > printer.print_bank_statement(account)
date || credit || debit || balance
06/11/2018 ||   || 50.00 || 150.00
06/11/2018 || 200.00 ||   || 200.00
 => nil
```
