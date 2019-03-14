class CreateEntries < ActiveRecord::Migration[5.2]
  def change
    create_table :entries do |t|
      t.date :date
      t.string :description
      t.decimal :amount, precision: 10, scale: 2
      t.decimal :current_balance, precision: 10, scale: 2
      t.references :account, foreign_key: true

      t.timestamps
    end
  end
end
