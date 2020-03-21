class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :initiated_chats, :class_name => 'Chat', :foreign_key => 'sender_id'
  has_many :received_chats, :class_name => 'Chat', :foreign_key => 'recipient_id'

  has_many :messages, through: :chats

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: {case_sensitive: false}#, 'valid_email_2/email': true

end
