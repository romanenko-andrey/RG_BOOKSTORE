class Book < ApplicationRecord
  has_many :reviews, :inverse_of => :book
  has_many :photos, :inverse_of => :book
  has_and_belongs_to_many :authors
  belongs_to :category

  paginates_per 4
  
  validates_presence_of :name, :short_description, :price, :description, :public_year
  validates_presence_of :dimensions, :materials, :photos
  validates :short_description, length: { minimum: 10, maximum: 200 }
  validates :photos, length: { minimum: 1 }
  validates :description, length: { minimum: 10, maximum: 2000 }
  validates :price, numericality: { greater_than: 0 }
  validates :materials, length: { minimum: 3, maximum: 50 }

  SORT_METHODS = [:newest, :popular, :asc_title, :desc_title,
                  :from_low_to_high_price, :from_hight_to_low_price].freeze

  scope :newest, -> { order(created_at: :desc) }
  scope :popular, -> { all }
  scope :asc_title, -> { order(name: :asc) }
  scope :desc_title, -> { order(name: :desc) }
  scope :from_low_to_high_price, -> { order(price: :asc) }
  scope :from_hight_to_low_price, -> { order(price: :desc) }
end
