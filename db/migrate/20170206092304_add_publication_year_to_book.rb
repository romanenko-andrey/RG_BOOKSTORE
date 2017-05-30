class AddPublicationYearToBook < ActiveRecord::Migration[5.0]
  def change
    add_column :books, :public_year, :date
  end
end
