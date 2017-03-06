class Note < ApplicationRecord
  belongs_to :book
  belongs_to :user

  validates :book, :user, :text, :rating, presence: true
  validates :rating, numericality: {only_integer: true, 
                                    greate_then_or_equal_to: 0,
                                    less_then_or_equal_to: 5}
end
