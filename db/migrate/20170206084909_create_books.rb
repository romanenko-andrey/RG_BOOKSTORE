class CreateBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :books do |t|
      t.string :name
      t.string :short_description
      t.float  :price
      t.text   :description
      t.string :dimensions
      t.string :materials

      t.timestamps
    end
  end
end
