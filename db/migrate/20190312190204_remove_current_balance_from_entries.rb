class RemoveCurrentBalanceFromEntries < ActiveRecord::Migration[5.2]
  def change
    remove_column :entries, :current_balance, :decimal
  end
end
