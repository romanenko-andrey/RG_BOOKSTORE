class CreditCardForm < Rectify::Form
  attribute :card_number, String
  attribute :card_name, String
  attribute :mmyy, String
  attribute :cvv, String
  
  validates :card_number, :presence => true, length: { is: 16 }, format: /\A\d+\z/
  validates :card_name, :presence => true, format: /\A[a-z\s]+\z/i, length: { maximum: 50 }
  validates :mmyy, :presence => true, length: { is: 5 }, format: /\A\d{2}\/\d{2}\z/
  validates :cvv, :presence =>true, length: { in: 3..4 }

  validate :mmyy_code

  def mmyy_code
    mm = :mmyy[0,2].to_i
    return if mm.in? (0 - 12)
    errors.add(:phone, I18n.t('validation.error_in_mmyy_code')
  end
end