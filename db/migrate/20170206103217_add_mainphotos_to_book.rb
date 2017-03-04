class AddMainphotosToBook < ActiveRecord::Migration[5.0]
  def change
    add_column :books, :title_photo, :string
  end
end
