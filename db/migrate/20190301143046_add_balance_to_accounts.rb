class AddBalanceToAccounts < ActiveRecord::Migration[5.2]
  def change
    add_column :accounts, :balance, :decimal, precision: 10, scale: 2
  end
end
