# :nodoc:
class Review < ApplicationRecord
  include AASM

  belongs_to :book, inverse_of: :reviews
  belongs_to :user, inverse_of: :reviews

  validates :book, :user, :text, :rating, presence: true
  validates :rating, numericality: { only_integer: true,
                                     greate_then_or_equal_to: 0,
                                     less_then_or_equal_to: 5 }

  aasm column: :status, whiny_transitions: false do
    state :unprocessed, initial: true
    state :approved
    state :rejected

    event :approve do
      transitions from: :unprocessed, to: :approved
    end

    event :reject do
      transitions from: :unprocessed, to: :rejected
    end
  end
end
