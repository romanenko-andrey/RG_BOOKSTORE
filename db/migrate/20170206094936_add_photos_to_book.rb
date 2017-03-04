class AddPhotosToBook < ActiveRecord::Migration[5.0]
  def change
    add_column :books, :photo1, :string
    add_column :books, :photo2, :string
    add_column :books, :photo3, :string
    add_column :books, :photo4, :string
  end
end
