class Message < ApplicationRecord
  belongs_to :user, required: true
  belongs_to :chat
  
  validates :message, presence: true

  def response_json
    {
      id: id,
      message: message,
      email: user.email,
      created_at: created_at,
    }
  end
end
