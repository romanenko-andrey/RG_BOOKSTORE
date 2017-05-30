class CreateBestsellers < ActiveRecord::Migration[5.0]
  def change
    create_table :bestsellers do |t|
      t.references :book, foreign_key: true

      t.timestamps
    end
  end
end
