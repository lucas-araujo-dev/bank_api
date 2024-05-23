class CreateTransactions < ActiveRecord::Migration[7.1]
  def change
    create_table :transactions do |t|
      t.string :payment_type, null: false
      t.belongs_to :account, null: false, foreign_key: true
      t.decimal :value, null: false
      t.decimal :value_with_tax, null: false

      t.timestamps
    end
  end
end
