class Book < ApplicationRecord
  has_many :notes
  has_and_belongs_to_many :authors
  belongs_to :category

  paginates_per 4

  scope :newest, -> { order(:created_at) }
  scope :popular, -> { all }
  scope :from_low_to_high_price, -> { order(:price) }
  scope :from_hight_to_low_price, -> { order(price: :desc) }
end
