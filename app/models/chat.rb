class Chat < ApplicationRecord
  has_many :connection, dependent: :destroy
  has_many :users, through: :connections
  has_many :messages
  belongs_to :user, foreign_key: "owner_id"
  
  validates :name, uniqueness: true, presence: true, allow_blank: false
end
