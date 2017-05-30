class CreateCoupons < ActiveRecord::Migration[5.0]
  def change
    create_table :coupons do |t|
      t.string :number
      t.string :discont
      t.string :status

      t.timestamps
    end
  end
end
