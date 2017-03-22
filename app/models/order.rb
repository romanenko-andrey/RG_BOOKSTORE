# :nodoc:
class Order < ApplicationRecord
  include AASM

  serialize  :items, Array
  belongs_to :user
  validates  :number, :items, :discont, :total_cost, presence: true
  validates  :delivery_methods, :delivery_cost, presence: true
  validates  :card_number, :card_name, :cvv, :mmyy, presence: true
  
  aasm column: :status, whiny_transitions: false do
    state :in_progress, initial: true
    state :in_queue
    state :in_delivery
    state :delivered
    state :canceled

    event :confirm do
      transitions from: :in_progress, to: :in_queue
    end

    event :sent do
      transitions from: :in_queue, to: :in_delivery
    end

    event :delivered do
      transitions from: :in_delivery, to: :delivered
    end

    event :cancel do
      transitions from: :in_progress, to: :canceled
    end
  end

  def self.assm_states
    [:all_orders] + aasm.states.map(&:name)
  end
end
