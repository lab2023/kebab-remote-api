class AddEnumerizeColumnsToUser < ActiveRecord::Migration
  def change
    add_column :users, :role, :integer
    add_column :users, :block_status, :integer  
  end
end
