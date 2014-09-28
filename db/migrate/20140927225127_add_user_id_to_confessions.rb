class AddUserIdToConfessions < ActiveRecord::Migration
  def change
    add_column :confessions, :user_id, :integer
    add_index :confessions, :user_id
  end
end
