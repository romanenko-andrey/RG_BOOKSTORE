# :nodoc:
class Author < ApplicationRecord
  has_and_belongs_to_many :books

  validates :first_name, :last_name, presence: true
  validates :first_name, :last_name, length: { maximum: 50 }
  validates :first_name, :last_name, format: { with: /\A[a-z]+\z/i }
end