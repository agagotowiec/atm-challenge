# Acceptance criteria

# Given:
#  a client makes a deposit of 1000 on 10-01-2023
# And a deposit of 2000 on 13-01-2023
# And a withdrawal of 500 on 14-01-2023
# When she prints her bank statement
# Then she would see

# date || credit || debit || balance
# 14/01/2023 || || 500.00 || 2500.00
# 13/01/2023 || 2000.00 || || 3000.00
# 10/01/2023 || 1000.00 || || 1000.00
require 'atm'

RSpec.describe "Atm" do
  context "client makes a deposit of 1000 on 10-01-2023" do
    it "prints the statement" do
      atm = Atm.new
      atm.make_deposit(1000, "10-01-2023")
      expect(atm.see_balance).to eq "date: 10-01-2023 || credit: 1000 || debit: 0 || balance: 1000/n"
    end
  end
  context "client makes a deposit of 2000 on 13-01-2023" do
    it "prints the statement" do
      atm = Atm.new
      atm.make_deposit(1000, "10-01-2023")
      atm.make_deposit(2000, "13-01-2023")
      expect(atm.see_balance).to eq "date: 10-01-2023 || credit: 1000 || debit: 0 || balance: 1000/n" +
                                "date: 13-01-2023 || credit: 2000 || debit: 0 || balance: 3000/n"
    end
  end
  context "client makes a withdrawal of 500 on 14-01-2023" do
    it "prints the statement" do
      atm = Atm.new
      atm.make_deposit(1000, "10-01-2023")
      atm.make_deposit(2000, "13-01-2023")
      atm.make_withdrawal(500, "14-01-2023")
      expect(atm.see_balance).to eq "date: 10-01-2023 || credit: 1000 || debit: 0 || balance: 1000/n" +
                                "date: 13-01-2023 || credit: 2000 || debit: 0 || balance: 3000/n" +
                                "date: 14-01-2023 || credit: 0 || debit: 500 || balance: 2500/n"
    end
  end
end
