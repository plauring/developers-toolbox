class AddStatusInVotes < ActiveRecord::Migration[5.0]
  def up
    add_column :votes, :status, :boolean
  end
  def down
    remove_column :votes, :status, :boolean
  end
end
