class Note < ApplicationRecord
  belongs_to :book
  belongs_to :user
end
