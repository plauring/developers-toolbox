class AddBelongstoColumnToReviews < ActiveRecord::Migration[5.0]
  
  def change
    add_column :reviews, :devtool_id, :integer
    add_index :reviews, :devtool_id
  end

end
