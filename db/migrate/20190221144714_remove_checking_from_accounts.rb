class RemoveCheckingFromAccounts < ActiveRecord::Migration[5.2]
  def change
    remove_column :accounts, :checking, :boolean
  end
end
