class RemoveBalanceFromAccounts < ActiveRecord::Migration[5.2]
  def change
    remove_column :accounts, :balance, :decimal
  end
end
