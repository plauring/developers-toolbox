class CreateDevtools < ActiveRecord::Migration[5.0]
  def change
    create_table :devtools do |t|
      t.string :title, null: false
      t.string :github_link
      t.string :body, null: false
      t.belongs_to :user

      t.timestamps null: false
    end
  end
end
