class User < ApplicationRecord
  # Include default devise modules. Others available are:
  #  :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_many :posts
  has_many :likes

  has_one :profile

  has_many :followers
  has_many :followables

  has_many :sent_messages, foreign_key: "sender", class_name: "Message"
  has_many :received_messages, foreign_key: "receiver", class_name: "Message"

  acts_as_followable
  acts_as_follower
end
