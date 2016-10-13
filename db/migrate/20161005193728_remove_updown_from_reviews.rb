class RemoveUpdownFromReviews < ActiveRecord::Migration[5.0]
  def up
    remove_column :reviews, :downvote
    remove_column :reviews, :upvote
  end
  def down
      add_column :reviews, :downvote, :integer, null: false, default: 0
      add_column :reviews, :upvote, :integer, null: false, default: 0
  end
end
