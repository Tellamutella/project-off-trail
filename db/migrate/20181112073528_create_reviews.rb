class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.references :location, foreign_key: true
      t.text :content
      t.integer :rating
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
