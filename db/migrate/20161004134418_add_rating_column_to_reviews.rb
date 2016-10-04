class AddRatingColumnToReviews < ActiveRecord::Migration[5.0]
  def up
    add_column :reviews, :rating, :integer, null: false
  end

  def down
    remove_column :reviews, :rating
  end
end
