class RemoveSavingsFromAccounts < ActiveRecord::Migration[5.2]
  def change
    remove_column :accounts, :savings, :boolean
  end
end
