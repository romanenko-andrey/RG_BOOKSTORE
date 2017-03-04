class CreditCardForm < Rectify::Form
  attribute :card_number, String
  attribute :card_name, String
  attribute :mmyy, String
  attribute :cvv, String
  
  validates :card_number, :presence => true, length: { is: 16 }
  validates :card_name, :presence => true
  validates :mmyy, :presence => true, length: { is: 5 }, format: /\A\d{2}\/\d{2}\z/
  validates :cvv, :presence =>true, length: { is: 3 }
end