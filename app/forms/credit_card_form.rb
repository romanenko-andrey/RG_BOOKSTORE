# :nodoc:
class CreditCardForm < Rectify::Form
  include ActiveModel::Model
  include Virtus.model
  
  attribute :card_number, String
  attribute :card_name, String
  attribute :mmyy, String
  attribute :cvv, String

  validates :card_number, presence: true, format: /\A\d+\z/, length: { is: 16 }
  validates :card_name, presence: true, format: /\A[a-z\s]+\z/i, length: { maximum: 50 }
  validates :mmyy, presence: true, length: { is: 5 }, format: /\A\d{2}\/\d{2}\z/
  validates :cvv, presence: true, length: { in: 3..4 }

  validate :mmyy_code

  def mmyy_code
    mm = mmyy[0, 2].to_i
    return if mm.between?(0, 12)
    errors.add(:phone, I18n.t('validation.error_in_mmyy_code'))
  end
end
