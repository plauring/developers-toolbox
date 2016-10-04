class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.string :title, null: false
      t.string :body, null: false

      t.timestamps null: false
    end
  end
end
