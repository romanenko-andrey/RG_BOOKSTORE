class CreateShippingAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :shipping_addresses do |t|
      t.string :first_name
      t.string :last_name
      t.string :addressee
      t.string :city
      t.string :zip
      t.string :country
      t.string :phone
      t.boolean :identical
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
