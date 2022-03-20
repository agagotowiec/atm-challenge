class Atm 

  def initialize
    @transactions = []
    @balance = 0
  end

  def make_deposit(money, date)
    @balance += money
    @transactions << { date: date,
                    credit: money,
                    debit: 0,
                    balance: @balance }
  end

  def make_withdrawal(money, date)
    @balance -= money
    @transactions << { date: date,
                    credit: 0,
                    debit: money,
                    balance: @balance }
  end

  def see_balance
    statement = ''
    @transactions.each do |transaction|
      statement += "date: #{transaction[:date]} || credit: #{transaction[:credit]} || debit: #{transaction[:debit]} || balance: #{transaction[:balance]}/n"
    end
    return statement
  end

end
