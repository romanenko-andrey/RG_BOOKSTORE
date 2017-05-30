class AddAltToBook < ActiveRecord::Migration[5.0]
  def change
    add_column :books, :alt, :string
  end
end
