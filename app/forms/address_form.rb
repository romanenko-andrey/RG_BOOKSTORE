# :nodoc:
class AddressForm < Rectify::Form
  include ActiveModel::Model
  include Virtus.model
  
  attribute :first_name, String
  attribute :last_name, String
  attribute :addressee, String
  attribute :city, String
  attribute :zip, String
  attribute :country, String
  attribute :phone, String
  attribute :identical, Boolean

  VALID_ADDRESS_REGEX = /\A[a-z0-9\,\-\s]+\z/i

  validates :first_name, :last_name, :city, presence: true
  validates :zip, :country, :phone, presence: true
  validates :first_name, :last_name, format: { with: /\A[a-z]+\z/i }
  validates :addressee, presence: true, format: { with: VALID_ADDRESS_REGEX }
  validates :city, format: { with: VALID_ADDRESS_REGEX }
  validates :first_name, :last_name, :city, :addressee, length: { maximum: 50 }
  validates :zip, length: { maximum: 10 }, format: { with: /\A[0-9\-]+\z/ }

  validate :phone_code

  def phone_code
    country_name = Country.find_by(id: country)
    return if country_name && phone =~ /\A\+#{country_name.zip}[\s0-9]{9,12}/
    errors.add(:phone, I18n.t('validation.error_in_phone_code'))
  end
end
