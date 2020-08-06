class Connection < ApplicationRecord
  belongs_to :chat, required: true
  belongs_to :user, required: true

  attribute :status, default: :allowed, presence: true
  enum status: [:allowed, :blocked]

  validates_uniqueness_of :chat_id, :scope => [:user_id]
end
