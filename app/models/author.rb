class Author < ApplicationRecord
  has_and_belongs_to_many :books

  validates_presence_of :first_name, :last_name
  validates_length_of :first_name, :last_name, maximum: 50
  validates_format_of :first_name, :last_name, with: /[a-z]/i
end
