class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.string :number
      t.text   :items, default: [].to_yaml
      t.string :discont
      t.string :delivery_methods
      t.string :delivery_cost
      t.string :total_cost

      t.string :card_number
      t.string :card_name
      t.string :cvv
      t.string :mmyy
      
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
