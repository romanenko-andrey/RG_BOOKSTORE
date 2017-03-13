class CreateOrdersStates < ActiveRecord::Migration[5.0]
  def change
    create_table :orders_states do |t|
      t.string :name

      t.timestamps
    end
  end
end
