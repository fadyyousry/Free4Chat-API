class Message < ApplicationRecord
  belongs_to :user, required: true
  belongs_to :chat
  
  validates :message, presence: true
end
