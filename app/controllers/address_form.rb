class AddressForm < Rectify::Form
  attribute :first_name, String
  attribute :last_name, String
  attribute :addressee, String
  attribute :city, String
  attribute :zip, String
  attribute :country, String
  attribute :phone, String
  attribute :identical, Boolean

  validates :first_name, :last_name, :city, :zip, :country, :phone, :presence => true
  validates :addressee, :presence => true
end
