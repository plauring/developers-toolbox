class RemoveUserIdColumnsFromSchema < ActiveRecord::Migration[5.0]
  def change
    remove_column :reviews, :user_id
    remove_column :reviews, :devtool_id
    remove_column :devtools, :user_id
  end
end
