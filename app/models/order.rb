class Order < ApplicationRecord
  serialize :items, Array
  belongs_to :user
  belongs_to :orders_state
  validates_presence_of :number, :items, :discont, :delivery_methods, :delivery_cost, :total_cost
  validates_presence_of :orders_state, :card_number, :card_name, :cvv, :mmyy
end
