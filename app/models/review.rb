class Review < ApplicationRecord
  belongs_to :book, :inverse_of => :reviews
  belongs_to :user, :inverse_of => :reviews

  validates :book, :user, :text, :rating, presence: true
  validates :rating, numericality: {only_integer: true, 
                                    greate_then_or_equal_to: 0,
                                    less_then_or_equal_to: 5}
end
