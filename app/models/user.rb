class User < ApplicationRecord
  has_many :notes, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_one :billing_address, dependent: :destroy
  has_one :shipping_address, dependent: :destroy
  accepts_nested_attributes_for :billing_address
  accepts_nested_attributes_for :shipping_address

  after_create :create_billing_address, :create_shipping_address

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :timeoutable,
         :omniauthable, :omniauth_providers => [:facebook, :github, :google]
  
  before_save { self.email = email.downcase }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 63 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  
  validates :password, presence: true, length: { minimum: 8 }, allow_nil: true

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
    end
  end
end
