class AddedBackInUserIdWithValidation < ActiveRecord::Migration[5.0]
  def change
    add_column :reviews, :user_id, :integer, null: false
    add_index :reviews, :user_id
    add_column :reviews, :devtool_id, :integer, null: false
    add_index :reviews, :devtool_id
    add_column :devtools, :user_id, :integer, null: false
    add_index :devtools, :user_id
  end
end
