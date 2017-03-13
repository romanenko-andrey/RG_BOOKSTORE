class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.string :title
      t.text :text
      t.integer :rating
      #t.boolean :checked, default: false
      t.string :status, default: 'unprocessed'
      t.references :book, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
