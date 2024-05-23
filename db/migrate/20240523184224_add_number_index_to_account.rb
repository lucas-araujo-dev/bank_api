class AddNumberIndexToAccount < ActiveRecord::Migration[7.1]
  def change
    add_index :accounts, :number, unique: true
  end
end
