class CreateAccounts < ActiveRecord::Migration[7.1]
  def change
    create_table :accounts do |t|
      t.bigint :number, null: false
      t.decimal :balance, null: false

      t.timestamps
    end
  end
end
