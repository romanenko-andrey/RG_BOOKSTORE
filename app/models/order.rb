# :nodoc:
class Order < ApplicationRecord
  serialize :items, Array
  belongs_to :user
  belongs_to :orders_state
  validates :number, :items, :discont, :total_cost, presence: true
  validates :orders_state, :delivery_methods, :delivery_cost, presence: true
  validates :card_number, :card_name, :cvv, :mmyy, presence: true
end
