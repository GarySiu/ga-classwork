class Bank

  attr_accessor :name, :accounts

  def initialize name
    @name = name
    @accounts = {}
  end

  def create_account(name, deposit)
    accounts[name] = deposit
  end

  def deposit(account, deposit)
    accounts[account] += deposit
  end

  def balance account
    accounts[account]
  end

  def withdraw(account, withdraw)
    accounts[account] -= withdraw
  end

end