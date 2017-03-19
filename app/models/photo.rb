# :nodoc:
class Photo < ApplicationRecord
  mount_uploader :file, ImageUploader
  belongs_to :book, inverse_of: :photos
end
