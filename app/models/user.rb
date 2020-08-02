class User < ApplicationRecord
  has_secure_password
  has_many :connections, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :chats, through: :connections
  has_many :owned_chats, class_name: "Chat", foreign_key: "owner_id", dependent: :destroy

  validates :email, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
end
