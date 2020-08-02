class Connection < ApplicationRecord
  belongs_to :chat, required: true
  belongs_to :user, required: true
end
