class AddUpvoteColumnInReviews < ActiveRecord::Migration[5.0]
  def up
    add_column :reviews, :upvote, :integer, null: false, default: 0
  end
  def down
    remove_column :reviews, :upvote
  end
end
