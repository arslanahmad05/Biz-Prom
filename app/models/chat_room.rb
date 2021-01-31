class ChatRoom < ApplicationRecord
  has_many :messages, dependent: :destroy

  validates_presence_of :unique_name
  validates_uniqueness_of :unique_name
end
