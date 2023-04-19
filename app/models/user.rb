class User < ApplicationRecord
  has_secure_password

  validates :name, presence: true, length: { maximum: 50, minimum: 3 }
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, presence: true, length: { minimum: 6 }
end
