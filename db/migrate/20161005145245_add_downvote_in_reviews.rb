class AddDownvoteInReviews < ActiveRecord::Migration[5.0]
  def up
    add_column :reviews, :downvote, :integer, null: false, default: 0
  end
  def down
    remove_column :reviews, :downvote
  end
end
